import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300,
          color:const Color.fromARGB(150,255,255,255),
          ),
          SizedBox(height: 50),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.dancingScript(
              color: Colors.blueAccent,
              fontSize:40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();//switch screen function in quiz.dart
              
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: const Text(
              ' Start Quiz',
              style: TextStyle(
                //color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//ElevatedButton.icon(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: const Color.fromARGB(
          //       255,
          //       122,
          //       16,
          //       221,
          //     ), // Button color
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     elevation: 6,
          //   ),
          //   label: const Text(
          //     ' Start Quiz',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       letterSpacing: 1,
          //     ),
          //   ),
          //   icon: const Icon(Icons.arrow_right_alt),
          // ),