import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/models/guess_question.dart';
import 'package:ultimate_quiz_app/models/odd_one_out_question.dart';

class GameProvider extends ChangeNotifier {
  //ODD ONE OUT - GAME 1
  int oddOneOutPageIndex = 0;
  int oddOneOutQuestionIndex = 0;
  int game1SelectedAnswer = 10;
  bool game1ShouldDisableSelection = true;
  List<OddOneOutQuestion> oddOneOutQuestions = [];
  Timer? oddOneOutTimer;

  void startOddOneOutTimer() {
    oddOneOutTimer = Timer.periodic(const Duration(seconds: 5), (timer) {});
  }

  //GUESSING - GAME 2
  int guessingPageIndex = 0;
  int guessingQuestionIndex = 0;
  int game2SelectedAnswer = 10;
  bool game2ShouldDisableSelection = true;
  Timer? guessingGameTimer;
  List<GuessQuestion> guessQuestions = [];

  Future<void> fetchOddOneOutQuestions() async {
    final List<OddOneOutQuestion> responseList = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('izbaci_uljeza').get();
      log(response.size.toString() + ' loaded odd one out');
      for (var element in response.docs) {
        responseList.add(OddOneOutQuestion.fromJson(element.data()));
      }
      oddOneOutQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      log(error.message.toString());
    }
  }

  Future<void> fetchGuessingQuestions() async {
    final List<GuessQuestion> responseList = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('pogadjanje').get();
      log(response.size.toString() + ' loaded guessing');
      for (var element in response.docs) {
        responseList.add(GuessQuestion.fromJson(element.data()));
      }
      guessQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      log(error.message.toString());
    }
  }

  Future<void> addOddOneOutQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('izbaci_uljeza').doc().set({
        'objasnjenje': 'U filmu Matrix, nije glumio Brad Pitt.',
        'tacan_odgovor': 1,
        'odgovori': ["Se7en", "The Matrix", "Mr. & Mrs. Smith", "Fight Club"],
      });
    } on FirebaseException catch (error) {
      log(error.message.toString());
    }
  }

  Future<void> addGuessQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('pogadjanje').doc().set({
        'imageURL':
            'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fverstappen.jpeg?alt=media&token=3148897d-4602-4879-8cae-35bed66a9761',
        'tacan_odgovor': 3,
        'odgovori': [
          "Valentino Rossi",
          "Charles Leclerc",
          "Lewis Hamilton",
          "Max Verstappen"
        ],
      });
    } on FirebaseException catch (error) {
      log(error.message.toString());
    }
  }

  // GUESSING GAME INCREMENT AND RESET
  void incrementGuessingQuestionIndex() {
    guessingQuestionIndex++;
    notifyListeners();
  }

  void incrementGuessingPageIndex() {
    guessingPageIndex++;
    notifyListeners();
  }

  void game2ResetSelection() {
    game2SelectedAnswer = 10;
    notifyListeners();
  }

  // ODD ONE OUT RESET AND INCREMENT
  void incrementOddOneOutQuestionIndex() {
    oddOneOutQuestionIndex++;
    notifyListeners();
  }

  void incrementOddOneOutIndex() {
    oddOneOutPageIndex++;
    notifyListeners();
  }

  void game1ResetSelection() {
    game1SelectedAnswer = 10;
    notifyListeners();
  }

  void resetCounters() {
    oddOneOutPageIndex = 0;
    guessingPageIndex = 0;
    oddOneOutQuestionIndex = 0;
    guessingQuestionIndex = 0;
    notifyListeners();
  }
}
