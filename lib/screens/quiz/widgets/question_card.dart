import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/constants.dart';
import 'package:quizapp/controllers/question_controller.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/quiz/widgets/options.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
      padding: const EdgeInsets.all(KDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: KDefaultPadding / 2,
          ),
          ...List.generate(
              question.options.length,
              (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _questionController.checkAns(question, index)))
        ],
      ),
    );
  }
}
