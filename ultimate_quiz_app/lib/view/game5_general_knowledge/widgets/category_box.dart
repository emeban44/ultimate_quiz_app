import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/utils/category_emojis.dart';

class GeneralKnowledgeCategoryBox extends StatelessWidget {
  const GeneralKnowledgeCategoryBox(this.category, this.selectCategory,
      {Key? key})
      : super(key: key);
  final String category;
  final Function(GameProvider) selectCategory;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final String categoryText =
        category.substring(0, category.length - 3).toLowerCase();
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: 150, maxWidth: 150, maxHeight: 40, minHeight: 40),
      child: GestureDetector(
        onTap: () {
          if (gameProvider.areYouChoosing == false ||
              gameProvider.generalKnowledgeCategorySelection[category] ==
                  true) {
            return;
          }
          selectCategory(gameProvider);
          gameProvider.generalKnowledgeCategorySelection[category] = true;
          gameProvider.selectedCategory = category;
          gameProvider.game5SelectedQuestion = gameProvider
              .generalKnowledgeQuestions
              .firstWhere((element) => element.category == category);
        },
        child: Opacity(
          opacity:
              gameProvider.generalKnowledgeCategorySelection[category] == true
                  ? 0.45
                  : gameProvider.areYouChoosing == false
                      ? 0.45
                      : 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.shade900.withOpacity(1),
                Colors.pink.shade900.withOpacity(1),
              ]),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.blue,
                ),
              ],
            ),
            child: FittedBox(
                child: Text(
              getCategoryEmojiTitle(category),
              style: const TextStyle(
                  fontFamily: 'Signika', fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
