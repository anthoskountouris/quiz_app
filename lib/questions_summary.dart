import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context){

      Color numColor(data){
      if (data['correct_answer'] == data['user_answer']){
        return  const Color.fromARGB(255, 120, 207, 77); // Fill color of the circle
       }
       else{
        return  const Color.fromARGB(255, 208, 70, 77); // Fill color of the circle
       }
  }

    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20.0, // Diameter of the circle
                  height: 20.0, // Diameter of the circle
                  decoration: BoxDecoration(
                    color: numColor(data),
                    shape: BoxShape.circle, // Makes the container a circle
                  ),
                  child: Center(child: Text(((data['question_index'] as int) + 1).toString(),)
                  ,),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(data['question'] as String, style: GoogleFonts.lato(color: Colors.white, fontSize: 15),),
                    const SizedBox(height: 5,),
                    Text(data['correct_answer'] as String, style: GoogleFonts.lato(color: const Color.fromARGB(255, 52, 240, 218), fontSize: 14),),
                    Text(data['user_answer'] as String)
                  ],),
                )
              ],),
            );
          }).toList(),
        ),
      ),
    );
  }

}