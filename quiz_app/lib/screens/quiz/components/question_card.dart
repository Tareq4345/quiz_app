import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questios.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

class QuestionCard  extends StatelessWidget {
  const QuestionCard ({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal:  kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: kBlackColor),),
            const SizedBox(height: kDefaultPadding,),
            ...List.generate(
              question.options.length, 
              (index)=>Option(text: question.options[index], index: index, press: ()=> _controller.checkAns(question, index),
              ),
              ),
          

        ],
      ),

    );
  }
}