import 'package:flutter/material.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

           Text("hello"),
          MaterialButton(
            onPressed: ()async{
              await _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>logintro()));
             },child: Text("Sign Out"),)
        ],
      ),
      ),
    );
  }
}

