import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:to_do/todo.dart';

import 'SignUp.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool loading=false;
  final _formfield=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final password=TextEditingController();
  final _auth=FirebaseAuth.instance;

  void login(){
    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword(email: emailcontroller.text, password: password.text.toString()).then((value){setState(() {
      loading=false ;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>logintro()));
    utils().toastmess(value.user!.email.toString());}).onError((error, stackTrace) {setState(() {
      loading=false;
    });debugPrint(error.toString());utils().toastmess(error.toString());});
  }

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
              Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700,color: Color(0xff03002e)),),
              SizedBox(height: 30,),
              Container(height:120,child: Image.asset('assets/ioio-removebg-preview.png',fit: BoxFit.cover,)),
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
                        TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.blueGrey,
                          obscureText: true,
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Password",
                              helperText: "Name@123...",
                              icon: Icon(Bootstrap.key,color: Colors.blueGrey,)),
                          validator: (value){if(value!.isEmpty){return 'Enter password';}return null;},
                        )
                      ],
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))) ,

                    onPressed: (){
                      if(_formfield.currentState!.validate()){
                        login();
                      }
                    }

                    , child: Expanded(child: Container(height: 50,child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.login),SizedBox(width: 10,),Text("Login")],),),)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?",style: TextStyle(color: Colors.blueGrey),),
                  TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));}, child: Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class utils{

  toastmess(String message)
  {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.orange,
        fontSize: 16.0
    );
  }

}
