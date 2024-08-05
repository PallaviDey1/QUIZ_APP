// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/score/score.dart';

class QuestionController extends GetxController
    // ignore: deprecated_member_use
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  // ignore: duplicate_ignore
  // ignore: unnecessary_this
  Animation get animation => this._animation;

  late PageController _pageController;

  // ignore: duplicate_ignore
  // ignore: unnecessary_this
  PageController get pageController => this._pageController;

  // ignore: prefer_final_fields
  List<Question> _questions = sampleData
      .map((question) => Question(
          id: question['id'],
          answer: question['answer_index'],
          question: question['question'],
          options: question['options']))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;

  late int _correctAns;

  int get correctAns => this._correctAns;

  late int _selectedAns;

  int get selectedAns => this._selectedAns;

  // ignore: prefer_final_fields
  late RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns = 0;

  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();

    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      //call scroe page
      Get.to(const ScoreScreen());
    }
  }
}