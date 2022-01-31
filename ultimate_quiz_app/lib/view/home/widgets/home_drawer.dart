import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue,
      child: Icon(
        Icons.pending,
        size: 50,
      ),
    );
  }
}
