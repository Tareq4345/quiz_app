
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questios.dart';

class QuestionController extends GetxController with GetSingleTickerProviderStateMixin{


  late AnimationController _animationController;
  late Animation _animation;

  Animation get aniumation => _animation;

  late PageController _pagecontroller;
  PageController get  pageController => _pagecontroller;

  List<Question> _questions = sample_data
        .map(
          (question)=>Question(
            id: question['id'], 
            question: question["question"], 
            answer: question["answer_index"],
            options: question["options"],),)
            .toList();

List<Question> get questions => _questions;

bool _isAnswered = false;
bool get isAnswered => _isAnswered;

late int _correctAns;
int get correctAns => _correctAns;

late int _selectedAns;
int get selectedAns => _selectedAns;

RxInt _questionNumber = 1.obs;
RxInt get questionNumber => _questionNumber;


int _numOfCorrectAns = 0;
int get numOfCorrectAns => _numOfCorrectAns;


@override
  void onInit() {
    _animationController = AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)..addListener((){
      update();
    });


    _animationController.forward().whenComplete(nextQuestion);
    _pagecontroller = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pagecontroller.dispose();

  }
  void checkAns(Question question, int selectedIndex){
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if(_selectedAns == _correctAns) _numOfCorrectAns++;
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3),(){
      nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value != questions.length){
      _isAnswered = false;
      _pagecontroller.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);

        _animationController.reset();

        _animationController.forward().whenComplete(nextQuestion);
    }
  }

  void updateTheQnNum(int index){
    _questionNumber.value = index + 1;
  }





}