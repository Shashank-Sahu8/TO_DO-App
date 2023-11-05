import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class progress extends StatefulWidget {
  const progress({super.key});

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress',style: GoogleFonts.lato(color: Color(0xff03002e),fontWeight: FontWeight.w700,fontSize: 26),),backgroundColor: Color(0xfffeebe6),automaticallyImplyLeading: false,elevation: 1,shadowColor: Colors.white60,),
      backgroundColor: Color(0xfffeebe6),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text('Worke Done :',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 18.0,
                    animation: true,
                    percent: 0.7,
                    center: new Text(
                      "70.0%",
                      style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Text('Efficiency:',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 18.0,
                    animation: true,
                    percent: 0.7,
                    center: new Text(
                      "70.0%",
                      style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
              ),
                 ],
               ),
          ],),
        ),
      ),
    );
  }
}




