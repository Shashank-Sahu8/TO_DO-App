import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'gsign.dart';
import 'ifloginlogin.dart';
import 'is.dart';
import 'log_intro.dart';
import 'login.dart';


class forgetpass extends StatefulWidget {
  const forgetpass({super.key});

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  final _formfield=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_sharp)),
                ],
              ),
              Text("Password",textAlign: TextAlign.center,style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700,color: Color(0xff03002e)),),
              SizedBox(height: 30,),
              Container(height:160,child: Image.asset('assets/questionmark_image-removebg-preview.png',fit: BoxFit.cover,)),
              SizedBox(height: 40,),
              Form(
                  key: _formfield,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0,left: 7.0),
                    child: Column(

                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.blueGrey,
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              hintText: "Email",
                              helperText: "e.g. example@gmail.com",
                              icon: Icon(Icons.email,color: Colors.blueGrey,)),
                          validator: (value){if(value!.isEmpty){return 'Enter email';}return null;},
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 40,right: 20.0,bottom: 20.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))) ,

                    onPressed: (){
                        _auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value){utils().toastmess("We have send you email to reset password");}).onError((error, stackTrace){utils().toastmess(error.toString());});
                    }

                    , child: Expanded(child: Container(height: 50,child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.ads_click),SizedBox(width: 10,),Text("Send email")],),),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
