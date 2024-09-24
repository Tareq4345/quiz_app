import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({super.key, required this.text, required this.index, required this.press});
  
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qController){
        Color getTheRightColor(){
          if(qController.isAnswered){
            if(index == qController.correctAns){
              return kGreenColor;
            }else if(index == qController.selectedAns && qController.selectedAns != qController.correctAns){
              return kRedColor;
            }
            
          }
          return kGrayColor;
        }
       IconData getTheRightIocn(){
        return getTheRightIocn()== kRedColor? Icons.close: Icons.done;
       }
       return InkWell(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(top: kDefaultPadding),
          padding:  const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor()),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index +1}. $text", 
                style: TextStyle(color: getTheRightColor(), fontSize: 16),
              )
            ],
          ),
        ),
       );

     
      });
  }
}