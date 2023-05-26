import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/data/questions_summary.dart';

class ResultScreen extends StatelessWidget {
   const ResultScreen({
    Key? key,
    required this.chosenAnswer,
    required this.onRestart,
  }) : super(key: key);

  final void Function() onRestart;
  final List<String> chosenAnswer;


  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) // i = i + 1)
    {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].txt,
          'correct_answer': questions[i].answer[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'จำนวนคำตอบที่ถูกต้องของคุณคือ $numCorrectQuestions ใน $numTotalQuestions คำถาม!',
              style: GoogleFonts.lato(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('เริ่มทดสอบใหม่'),
            ),
          ],
        ),
      ),
    );
  }
}
