import 'package:flutter/material.dart';

class SortByFinalResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 150,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Rezultat:',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Signika', fontSize: 26),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '7 : 1',
                style: TextStyle(fontFamily: 'Acme'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
