import 'package:flutter/material.dart';
import 'package:flutter_first/answer_button.dart';
import 'package:flutter_first/data/questions.dart';
import 'package:flutter_first/models/quiz.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  final QuizQuestion currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.text, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),

          ...currentQuestion.answers.map((answer) {
            return AnswerButton(answerText: answer, onTap: () {});
          }),
        ],
      ),
    );
  }
}
