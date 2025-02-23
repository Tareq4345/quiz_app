

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/icons/bg.svg', fit:BoxFit.fill),
          SafeArea(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                    "Let's Play Quiz ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),),
                const Text("Enter Your information below"),
                const Spacer(),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1C2341),
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12),),
                    ),

                ),),
                const Spacer(),
                InkWell(
                  onTap: (){
                    Get.to(()=>const QuizScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(kDefaultPadding*0.75),
                    decoration: const BoxDecoration(
                      gradient:kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text("Lets Start Quiz",
                     style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.black),),

                  ),
                ),
                const Spacer(flex: 2,),
              ],
            ),
          ))
        ],
      ),
    );
  }
}