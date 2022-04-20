import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/main.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/utils/shared_preferences.dart';
import 'package:ultimate_quiz_app/view/home/page/home_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/page/play_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/page/profile_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/widgets/bottom_nav_bar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/home_drawer.dart';
import 'package:ultimate_quiz_app/view/splash/splash_screen.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    if (sharedPrefs.getAuthenticated!) {
      print('...loading home page...');
      Future<void>(() {
        showLoaderDialog(context);
      });
    }
    fetchAllRequiredData(authProvider).whenComplete(() {
      Navigator.pop(context);
    });
    super.initState();
  }

  Future<void> fetchAllRequiredData(AuthProvider authProvider) async {
    try {
      await Future.wait([authProvider.fetchUserData()]);
      sharedPrefs.setAuthenticated(true);
    } on FirebaseException catch (error) {
      log(error.message!);
    }
  }

  final List<Widget> _pages = [
    HomeTabBody(),
    PlayTabBody(),
    ProfileTabBody(),
  ];

  final List<String> _titles = [
    "HOME",
    "PLAY",
    "PROFILE",
  ];

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: _selectedPageIndex == 1 ? 0.45 : 0.5,
          image: _selectedPageIndex == 1
              ? const AssetImage("assets/images/neon_smoke_light.jpeg")
              : const AssetImage("assets/images/neon_lights_upside.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: HomeDrawer(),
        appBar: AppBar(
          title: Text(
            _titles[_selectedPageIndex],
            style: Theme.of(context).textTheme.headline1,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent, //Colors.deepPurple.shade900,
          actions: [
            IconButton(
                onPressed: () async {
                  await authProvider.logoutUser();
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        //body: _pages[_selectedPageIndex],
        body: IndexedStack(
          children: [
            HomeTabBody(),
            PlayTabBody(),
            ProfileTabBody(),
          ],
          index: _selectedPageIndex,
        ), //_pages[_selectedPageIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectPage: _selectPage,
          selectedIndex: _selectedPageIndex,
        ),
      ),
    );
  }
}
