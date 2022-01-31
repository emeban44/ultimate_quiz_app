import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/view/home/page/home_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/page/profile_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/widgets/bottom_nav_bar.dart';
import 'package:ultimate_quiz_app/view/splash/splash_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    HomeTabBody(),
    HomeTabBody(),
    ProfileTabBody(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(actions: []),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectPage: _selectPage,
        selectedIndex: _selectedPageIndex,
      ),
    );
  }
}
