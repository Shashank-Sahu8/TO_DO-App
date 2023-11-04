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
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event()));},child: Icon(Icons.add),),
      drawer: NavBar(),
      appBar: AppBar(title: Text("To_Do"),),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("hello"),
          // MaterialButton(
          //   onPressed: ()async{
          //     // LocalNotifications.showSimpleNotification(title: 'To_Do',body: 'Successful Log In',payload: 'hello');
          //     await _auth.signOut();
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>logintro()));
          //    },child: Text("Sign Out"),)
        ],
      ),
      ),
    );
  }
}