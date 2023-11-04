import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/Sign/SignUp.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:to_do/Sign/login.dart';
import 'package:to_do/todo.dart';

class issignin extends StatelessWidget {
  const issignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshort){
          if(snapshort.hasData)
          {
            return pagepage();
          }
          else
          {
            return signup();
          }
        },
      ),
    );
  }
}
