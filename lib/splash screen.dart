import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do/first page.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>page_1()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
          body: Center(
            child: Stack(alignment: Alignment.center,
              children: [
                Container(
                  height: 130,
                  width: 120,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/td_icon-removebg-preview.png'),fit: BoxFit.cover)),
                ),
                SpinKitPulse(color:Colors.blueGrey ,size: 200,)
              ],
            ),
          ),

    );
  }
}


//MediaQuery.of(context).size.height*0.5;
//MediaQuery.of(context).size.width*0.8;
//if(MediaQuery.orientation==Orientation.portrait)return widget1; else return widget2;