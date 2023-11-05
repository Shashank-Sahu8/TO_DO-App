import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/add_event.dart';
import 'package:to_do/bottom_nav/account.dart';
import 'package:to_do/bottom_nav/calender.dart';
import 'package:to_do/bottom_nav/home.dart';
import 'package:to_do/bottom_nav/progress.dart';
import 'package:to_do/notification.dart';
import 'package:to_do/navbar.dart';
class pagepage extends StatefulWidget {
  const pagepage({super.key});
  @override
  State<pagepage> createState() => _pagepageState();
}

class _pagepageState extends State<pagepage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User? _user;
  int selitem=0;
  List pages=const[
    homepage(),
    progress(),
    calender(),
    account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffeebe6),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfffeebe6),
        type: BottomNavigationBarType.fixed,
        elevation: 34,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.poll_rounded),label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Bootstrap.person),label: 'Account')
        ],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          unselectedItemColor: Color(0xff536878),
          selectedItemColor: Color(0xff03002e),
          currentIndex: selitem,
          onTap: (setValue)
          {
            setState(() {
              selitem=setValue;
            });
          }
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event()));},child: Icon(Icons.add),backgroundColor:Color(0xff03002e) ),
      //drawer: NavBar(),
      //appBar: AppBar(title: Text("To_Do"),backgroundColor: Color(0xff03002e),),
      body:pages[selitem]
    );
  }
}