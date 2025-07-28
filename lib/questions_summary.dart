import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  bool isThisAnswerCorrect(summaryRow) {
    return summaryRow['correct_answer'] == summaryRow['user_answer'];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((summaryRow) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isThisAnswerCorrect(summaryRow) ? Colors.green : Colors.red
                      ),
                      child: Text(
                        ((summaryRow['question_index'] as int) + 1).toString(),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          Text(summaryRow['question'] as String),
                          const SizedBox(height: 5),
                          Text(summaryRow['user_answer'] as String),
                          const SizedBox(height: 5),
                          Text(summaryRow['correct_answer'] as String),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
