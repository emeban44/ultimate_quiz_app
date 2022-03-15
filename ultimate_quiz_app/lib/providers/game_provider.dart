import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/models/estimation_question.dart';
import 'package:ultimate_quiz_app/models/guess_question.dart';
import 'package:ultimate_quiz_app/models/odd_one_out_question.dart';
import 'package:ultimate_quiz_app/models/sort_by_question.dart';

class GameProvider extends ChangeNotifier {
  //ODD ONE OUT - GAME 1
  int oddOneOutPageIndex = 0;
  int oddOneOutQuestionIndex = 0;
  int game1SelectedAnswer = 10;
  bool game1ShouldDisableSelection = true;
  List<OddOneOutQuestion> oddOneOutQuestions = [];
  Timer? oddOneOutTimer;

  // void startOddOneOutTimer() {
  //   oddOneOutTimer = Timer.periodic(const Duration(seconds: 5), (timer) {});
  // }

  //GUESSING - GAME 2
  int guessingPageIndex = 0;
  int guessingQuestionIndex = 0;
  int game2SelectedAnswer = 10;
  bool game2ShouldDisableSelection = true;
  Timer? guessingGameTimer;
  List<GuessQuestion> guessQuestions = [];

  //ESTIMATION - GAME 3
  int estimationPageIndex = 0;
  int estimationQuestionIndex = 0;
  int game3SelectedAnswer = 10;
  bool game3ShouldDisableSelection = true;
  Timer? estimationGameTimer;
  List<EstimationQuestion> estimationQuestions = [];

  //SORT BY - GAME 4
  int sortByPageIndex = 0;
  int sortByQuestionIndex = 0;
  int game4SelectedAnswer = 10;
  int correctSorts = 0;
  bool game4ShouldDisableSelection = true;
  bool homePlayerAllCorrect = false;
  bool awayPlayerAllCorrect = false;
  Timer? sortyByGameTimer;
  List<SortByQuestion> sortByQuestions = [];

  //GENERAL KNOWLEDGE - GAME 5
  int generalKnowledgePageIndex = 0;
  int generalKnowledgeQuestionIndex = 0;
  int game5SelectedAnswer = 10;
  bool game5ShouldDisableSelection = true;
  Timer? generalKnowledgeByGameTimer;
  List<SortByQuestion> generalKnowledgeQuestions = [];

  Future<void> fetchOddOneOutQuestions() async {
    final List<OddOneOutQuestion> responseList = [];
    final List<int> randomNumbers = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('izbaci_uljeza').get();
      developer.log(response.size.toString() + ' loaded odd one out');
      for (var element in response.docs) {
        responseList.add(OddOneOutQuestion.fromJson(element.data()));
      }
      for (int i = 0; i < 5; i++) {
        bool didGenerate = false;
        do {
          final int kocka = Random().nextInt(responseList.length);
          if (!randomNumbers.contains(kocka)) {
            randomNumbers.add(kocka);
            didGenerate = true;

            oddOneOutQuestions.add(responseList[kocka]);
          }
        } while (!didGenerate);
      }
      //oddOneOutQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> fetchGuessingQuestions() async {
    final List<GuessQuestion> responseList = [];
    final List<int> randomNumbers = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('pogadjanje').get();
      developer.log(response.size.toString() + ' loaded guessing');
      for (var element in response.docs) {
        responseList.add(GuessQuestion.fromJson(element.data()));
      }
      for (int i = 0; i < 5; i++) {
        bool didGenerate = false;
        do {
          final int kocka = Random().nextInt(responseList.length);
          if (!randomNumbers.contains(kocka)) {
            randomNumbers.add(kocka);
            didGenerate = true;
            guessQuestions.add(responseList[kocka]);
          }
        } while (!didGenerate);
      }
      //guessQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> fetchEstimationQuestions() async {
    final List<EstimationQuestion> responseList = [];
    final List<int> randomNumbers = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('ko_je_blizi').get();
      developer.log(response.size.toString() + ' loaded estimation');
      for (var element in response.docs) {
        responseList.add(EstimationQuestion.fromJson(element.data()));
      }
      for (int i = 0; i < 5; i++) {
        bool didGenerate = false;
        do {
          final int kocka = Random().nextInt(responseList.length);
          if (!randomNumbers.contains(kocka)) {
            randomNumbers.add(kocka);
            didGenerate = true;
            estimationQuestions.add(responseList[kocka]);
          }
        } while (!didGenerate);
      }
      //estimationQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> fetchSortByQuestions() async {
    final List<SortByQuestion> responseList = [];
    final List<int> randomNumbers = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection('poredaj_po').get();
      developer.log(response.size.toString() + ' loaded sort by');
      for (var element in response.docs) {
        responseList.add(SortByQuestion.fromJson(element.data()));
      }
      for (int i = 0; i < 2; i++) {
        bool didGenerate = false;
        do {
          final int kocka = Random().nextInt(responseList.length);
          if (!randomNumbers.contains(kocka)) {
            randomNumbers.add(kocka);
            didGenerate = true;
            sortByQuestions.add(responseList[kocka]);
          }
        } while (!didGenerate);
      }
      //estimationQuestions = [...responseList];
      notifyListeners();
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> addOddOneOutQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('izbaci_uljeza').doc().set({
        'objasnjenje': 'Astra nije model Renaulta nego Opela',
        'tacan_odgovor': 0,
        'odgovori': ["Astra", "Clio", "Captur", "Megane"],
      });
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> addGuessQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('pogadjanje').doc().set({
        'imageURL':
            'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fbremen.png?alt=media&token=86a71182-b482-4745-a21b-6c09bb86b7d7',
        'tacan_odgovor': 2,
        'objasnjenje': 'Pogodi grb fudbalskog kluba:',
        'odgovori': ["Wolfsburg", "Celtic", "Werder Bremen", "Panathinaikos"],
      });
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> addEstimationQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('ko_je_blizi').doc().set({
        'pitanje': 'Koje godine je izgrađen Berlinski zid?',
        'tacan_odgovor': '1961',
        'ima_zarez': false,
      });
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
    }
  }

  Future<void> addSortByQuestionToDB() async {
    try {
      await FirebaseFirestore.instance.collection('poredaj_po').doc().set({
        'pitanje':
            'Hronološki poredaj historijske događaje, počevši od najstarijeg:',
        'tacan_poredak': [
          "Grčko-perzijski ratovi",
          "Pad Zapadnog Rimskog carstva",
          "Povelja Kulina Bana",
          "Otkriće Amerike",
          "Pad Bastilje",
        ],
        'shuffle_poredak': [
          "Pad Zapadnog Rimskog carstva",
          "Povelja Kulina Bana",
          "Pad Bastilje",
          "Grčko-perzijski ratovi",
          "Otkriće Amerike",
        ],
      });
    } on FirebaseException catch (error) {
      developer.log(error.message.toString());
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

  // ESTIMATION GAME RESET AND INCREMENT
  void incrementEstimationQuestionIndex() {
    estimationQuestionIndex++;
    notifyListeners();
  }

  void incrementEstimationIndex() {
    estimationPageIndex++;
    notifyListeners();
  }

  void game3ResetSelection() {
    game3SelectedAnswer = 10;
    notifyListeners();
  }

  // SORT BY GAME RESET AND INCREMENT
  void incrementSortByQuestionIndex() {
    sortByQuestionIndex++;
    notifyListeners();
  }

  void incrementSortByIndex() {
    sortByPageIndex++;
    notifyListeners();
  }

  void game4ResetSelection() {
    game4SelectedAnswer = 10;
    correctSorts = 0;
    homePlayerAllCorrect = false;
    notifyListeners();
  }

  // GENERAL KNOWLEDGE RESET AND INCREMENT
  void incrementGeneralKnowledgeQuestionIndex() {
    generalKnowledgeQuestionIndex++;
    notifyListeners();
  }

  void incrementGeneralKnowledgeIndex() {
    generalKnowledgePageIndex++;
    notifyListeners();
  }

  void game5ResetSelection() {
    game5SelectedAnswer = 10;
    notifyListeners();
  }

  void resetCounters() {
    oddOneOutPageIndex = 0;
    guessingPageIndex = 0;
    oddOneOutQuestionIndex = 0;
    guessingQuestionIndex = 0;
    estimationPageIndex = 0;
    estimationQuestionIndex = 0;
    sortByPageIndex = 0;
    sortByQuestionIndex = 0;
    game1ResetSelection();
    game2ResetSelection();
    game3ResetSelection();
    game4ResetSelection();
    game5ResetSelection();
    notifyListeners();
  }
}
