import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
 
class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  @override
  // void initState(){
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  @override
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      //activeScreen = const QuestionsScreen();
    });
  }
  void backtoHomepage(){
    setState(() {
      activeScreen='start-screen';
      selectedAnswers=[];
    });
  }
//  to make sure chooseAnswer is invoked whenever a answer is picked in quiz widget
//so pass it to QuestionsScreen Widget
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    
    if(selectedAnswers.length==questions.length){
      setState(() {
  //       selectedAnswers = [];//no need when result is showed
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // var screenWidget = activeScreen == 'start=screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen=='result-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers,backtoHomepage: backtoHomepage,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          //child: activeScreen,
        ),
        //backgroundColor:const Color.fromARGB(255, 122, 16, 221),
      ),
    );
  }
}
