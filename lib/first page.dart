// ignore_for_file: camel_case_types
import 'package:to_do/Sign/if_logedin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:to_do/todo.dart';
class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user=event;
      });
    });
  }
  int c_index=0;
  List imageList =[
    'assets/todo theme.jpg',
    'assets/todo_image3-removebg-preview.png',
    'assets/todo_image4-removebg-preview.png',
  ];
  List headtext=[
    "Unable to manage your time?",
    "Confused ?",
    "Relax"
  ];
  List disctext=[
    "jhgfdfhkjbhjkmhgnkghjnjbhvbnm,nbvg",
    "jhgfdfhkjbhjkmhgnkghjnjbhvbnm,nbvg",
    "jhgfdfhkjbhjkmhgnkghjnjbhvbnm,nbvg"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffd954),
      appBar: AppBar(
        backgroundColor: Color(0xffffd954),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>islogein()));},
              child: Text("Skip")),
        ],

      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: PageView.builder(
              itemBuilder: (context,index){
              return  Container(
                color: Color(0xffffd954),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                      children: [
                            Text(headtext[index].toString(),style: TextStyle(),),
                            Text(disctext[index].toString(),style: TextStyle(fontSize: 18),),
                      ],
                      ),
                      Container(
                        child: Image.asset('${imageList[index]}'),
                      ),
                     DotsIndicator(dotsCount: imageList.length,position: index,),
                      FloatingActionButton(
                          backgroundColor: Color(0xff03002e),
                          child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>islogein()));
                          })
                    ],
                  ),
                ),
              );

              },
            itemCount:imageList.length ,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            onPageChanged: (index){
                setState(() {
                  c_index=index;
                });
            },
          ),
      ),
    );
  }
}
