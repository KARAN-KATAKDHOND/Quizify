import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;
  // final List<Color> circleColors = [
  //   Colors.red,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.orange,
  //   Colors.purple,
  //   Colors.teal,
  // ];

  @override
  Widget build(context) {
    return SizedBox(
      // to create a box with fix height
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 14, // size of cir
                  backgroundColor:(data['user_ans'] as String)==(data['correct_ans'] as String)?Colors.green:Colors.red, // background color of circle
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Text(
                //   ((data['question_index'] as int) + 1).toString(),
                //   style: TextStyle(
                //     backgroundColor: Colors.red,

                //   ),

                // ), //question number
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question'] as String),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ), //actual question txt
                      SizedBox(height: 5),
                      Text(
                        (data['user_ans'] as String),
                        style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 200, 191, 191),
                          fontWeight: FontWeight.normal,
                        ),
                      ), //selected answer
                      Text(
                        (data['correct_ans'] as String),
                        style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(255, 1, 249, 9),
                          fontWeight: FontWeight.w400,
                        ),
                      ), 
                      SizedBox(height: 20), //correct answer
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
