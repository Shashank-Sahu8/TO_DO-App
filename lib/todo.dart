import 'package:flutter/material.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/add_event.dart';
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
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event()));},child: Icon(Icons.add),backgroundColor:Color(0xff03002e) ),
      drawer: NavBar(),
      appBar: AppBar(title: Text("To_Do"),backgroundColor: Color(0xff03002e),),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("hello"),

        ],
      ),
      ),
    );
  }
}