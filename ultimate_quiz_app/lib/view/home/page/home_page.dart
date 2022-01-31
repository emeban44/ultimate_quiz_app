import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/view/home/page/home_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/page/play_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/page/profile_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/widgets/bottom_nav_bar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/home_drawer.dart';
import 'package:ultimate_quiz_app/view/splash/splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  int _selectedPageIndex = 2;

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
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          image: AssetImage("assets/images/neon_lights_upside.jpeg"),
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
          elevation: 1,
          backgroundColor: Colors.transparent, //Colors.deepPurple.shade900,
          actions: [
            IconButton(
                onPressed: () async {
                  await authProvider.logoutUser();
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectPage: _selectPage,
          selectedIndex: _selectedPageIndex,
        ),
      ),
    );
  }
}
