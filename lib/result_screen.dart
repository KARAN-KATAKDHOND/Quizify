import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});
  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You Answered X out of Y Questions Correctly!'),
            const SizedBox(height: 30),
            const Text('List of Answers and Questions..'),
            const SizedBox(height: 30,),
            TextButton(
              onPressed:() {},
              child:const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
    }
}