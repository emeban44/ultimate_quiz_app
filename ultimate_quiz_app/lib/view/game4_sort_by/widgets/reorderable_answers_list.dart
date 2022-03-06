import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByReorderableAnswerList extends StatefulWidget {
  SortByReorderableAnswerList();
  //final List<String> _list;
  @override
  _SortByReorderableAnswerListState createState() =>
      _SortByReorderableAnswerListState();
}

class _SortByReorderableAnswerListState
    extends State<SortByReorderableAnswerList> {
  final List<String> _list = [
    'Novak Đoković',
    'Andy Murray',
    'Marin Čilić',
    'Rafael Nadal',
    'Damir Džumhur'
  ];
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Expanded(
      flex: 3,
      child: ShowUpAnimation(
        delayStart: Duration(
            milliseconds: gameProvider.sortByPageIndex == 0 ? 4200 : 2600),
        animationDuration: const Duration(seconds: 1),
        curve: Curves.linear,
        offset: 0.01,
        child: Container(
          margin: const EdgeInsets.only(top: 17.5),
          child: ReorderableListView(
              buildDefaultDragHandles: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < _list.length; i++)
                  ReorderableDragStartListener(
                    index: i,
                    key: ValueKey(_list[i]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.5,
                        horizontal: 25,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            color: Colors.blue,
                          )
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade900, Colors.pink.shade900],
                        ),
                      ),
                      child: Text(
                        (i + 1).toString() + '.  ' + _list[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Signika', fontSize: 21),
                      ),
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                //setState for new index
                setState(() {
                  final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                  final answer = _list.removeAt(oldIndex);
                  _list.insert(index, answer);
                });
              }),
        ),
      ),
    );
  }
}
