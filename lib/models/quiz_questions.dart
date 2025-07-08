import 'package:flutter/material.dart';

class QuizQuestions {
  const QuizQuestions(this.question,this.answers);
  final String question;
  final List<String> answers;
 List<String> getShuffledAnswers(){
  final Shuffled_list = List.of(answers);
  Shuffled_list.shuffle();
  return Shuffled_list;
 }
}