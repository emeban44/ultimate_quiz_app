import 'package:flutter/material.dart';

class ProfileUsername extends StatelessWidget {
  ProfileUsername(this.username, {this.gameStartLobby = false});
  final String username;
  final bool gameStartLobby;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: gameStartLobby ? 0 : 5,
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
