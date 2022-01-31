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
      child: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: 40,
              color: Colors.pink,
            ),
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/home_center_play.jpg"),
            ),
            label: 'PLAY',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 40,
              color: Colors.pink,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
