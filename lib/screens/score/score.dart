import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controllers/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Score"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${_questionController.correctAns * 10}/ ${_questionController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
