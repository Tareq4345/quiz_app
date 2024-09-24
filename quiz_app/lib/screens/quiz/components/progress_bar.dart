import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),

      child:  GetBuilder<QuestionController>(builder:(controller){
        return Stack(
          children: [
            LayoutBuilder(builder: (context,constraints)=> Container(
              width:  constraints.maxWidth * controller.aniumation.value,
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.circular(50),
                ),
            ),),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.aniumation.value * 60).round()} sec"),
                    SvgPicture.asset("assets/icons/clock.svg")
                  ],
                ),
                  
            ),),
          ],
        );
      }),
    );
  }
}