import 'package:flutter/material.dart';

class PlayerLobbyStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          _statRowWidget(title: 'Broj igara:', stat: '1024 🎲'),
          _statRowWidget(stat: '123 🏆', title: 'Broj pobjeda:'),
          _statRowWidget(title: 'Procenat pobjeda:', stat: '57/💯'),
          _statRowWidget(title: 'Rekordni niz pobjeda:', stat: '7 🔥'),
          // _statRowWidget(title: 'Favorit kategorija:', stat: 'Filmovi 🎬'),
        ],
      ),
    );
  }

  Widget _statTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Viga',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _actualStat(String stat, [bool changeFont = false]) {
    return Row(
      children: [
        Text(
          stat,
          style: TextStyle(
            color: Colors.white,
            fontSize: changeFont ? 18 : 20,
            fontFamily: changeFont ? 'Viga' : 'Acme',
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _statRowWidget({required String title, required String stat}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _statTitle(title),
          Row(
            children: [
              if (title == 'Favorit kategorija:')
                _actualStat(stat, true)
              else
                _actualStat(stat),
            ],
          ),
        ],
      ),
    );
  }
}
