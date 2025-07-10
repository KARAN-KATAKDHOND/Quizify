import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers,required this.backtoHomepage});
  final List<String> chosenAnswers;
  final void Function() backtoHomepage;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_ans': questions[i].answers[0],
        'user_ans': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return (data['user_ans'] == data['correct_ans']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $numCorrectQuestions out of $numTotalQuestions Questions Correctly!',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: backtoHomepage,
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              icon: Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
