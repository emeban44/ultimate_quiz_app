import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    required this.selectPage,
    required this.selectedIndex,
  });
  final Function(int) selectPage;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
          gradient: LinearGradient(colors: [
            Colors.blue.shade400.withOpacity(1),
            Colors.purple.shade500.withOpacity(1),
            Colors.pink.shade900.withOpacity(1),
          ])),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: selectPage,
        currentIndex: selectedIndex,
        elevation: 50,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Acme',
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: selectedIndex == 2
            ? Colors.pink.shade100
            : selectedIndex == 1
                ? Colors.purple.shade100
                : Colors.blue.shade100,
        selectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            activeIcon: Icon(
              Icons.home_rounded,
              size: 40,
              color: Colors.blue.shade300, //Colors.pink.shade700,
            ),
            icon: const Icon(
              Icons.home_rounded,
              size: 35,
              color: Colors.white,
            ),
            label: selectedIndex == 0 ? 'HOME' : '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: const CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(
                  "assets/images/play_button.jpg"), //AssetImage("assets/images/home_center_play.jpg"),
            ),
            label: selectedIndex == 1 ? 'PLAY' : '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: const Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 40,
              color: Colors.pink.shade200,
            ),
            label: selectedIndex == 2 ? 'PROFIL' : '',
          ),
        ],
      ),
    );
  }
}
