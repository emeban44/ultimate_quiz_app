import 'package:flutter/material.dart';

class ProfileUsername extends StatelessWidget {
  ProfileUsername(this.username);
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 5,
        top: 3,
        left: 1,
        right: 2.5,
      ),
      child: Text(
        username,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Acme',
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
    );
  }
}
