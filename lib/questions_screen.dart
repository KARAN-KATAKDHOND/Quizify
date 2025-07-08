import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer,super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  answerQuestion(){
    //Widget.onSelectAnswer(String selectedAnswers)
    //as we also want to rebuild the widget after 
    //updation of the currentQuestionIndex we use setState((){})
    setState(() {
      //while(currentQuestionIndex<6)
      currentQuestionIndex++;
    });
    
  }
  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionIndex];
    return SizedBox(
      width:double.infinity,//states that use as much value as possible or use as much width as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisSize: MainAxisSize.max,
          //using alternative of SizedBox for dynamic width
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            currentQuestions.question,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 204, 153, 251),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
        //...used to spread the element of list for Answer buttons
        // 
            ...currentQuestions.getShuffledAnswers().map((answer){
              return AnswerButton(ans: answer,onTap:answerQuestion,);
            }),
        
        
            /*AnswerButton(ans: currentQuestions.answers[0], onTap: (){}),
            const SizedBox(height: 10),
            AnswerButton(ans: currentQuestions.answers[1], onTap: (){}),
            const SizedBox(height: 10),
            AnswerButton(ans: currentQuestions.answers[2], onTap: (){}),
            const SizedBox(height: 10),
            AnswerButton(ans: currentQuestions.answers[3], onTap: (){}),
            */
          ]
        ),
      ),
    );
  }
}
