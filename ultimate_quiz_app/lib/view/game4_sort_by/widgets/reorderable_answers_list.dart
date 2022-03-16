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
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.sortByPageIndex;
    return Expanded(
      flex: 3,
      child: ShowUpAnimation(
        delayStart: Duration(
            milliseconds: gameProvider.sortByPageIndex == 0 ? 4200 : 1600),
        animationDuration: const Duration(seconds: 1),
        curve: Curves.linear,
        offset: 0.01,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: ReorderableListView(
              buildDefaultDragHandles: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0;
                    i <
                        gameProvider
                            .sortByQuestions[currentPage].shuffledList.length;
                    i++)
                  ReorderableDragStartListener(
                    index: i,
                    key: ValueKey(gameProvider
                        .sortByQuestions[currentPage].shuffledList[i]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.5,
                        horizontal: 25,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxWidth: 500,
                            minWidth: 100,
                            maxHeight: 27,
                            minHeight: 27),
                        child: FittedBox(
                          child: Text(
                            (i + 1).toString() +
                                '.  ' +
                                (gameProvider.sortByQuestions[currentPage]
                                    .shuffledList[i]),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Signika', fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                //setState for new index
                //if (gameProvider.sortByPageIndex == 0) {
                setState(() {
                  final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                  final answer = gameProvider
                      .sortByQuestions[currentPage].shuffledList
                      .removeAt(oldIndex);
                  gameProvider.sortByQuestions[currentPage].shuffledList
                      .insert(index, answer);
                });
                // } else {
                // setState(() {
                //   final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                //   final answer = _list2.removeAt(oldIndex);
                //   _list2.insert(index, answer);
                // });
                //}
              }),
        ),
      ),
    );
  }
}
