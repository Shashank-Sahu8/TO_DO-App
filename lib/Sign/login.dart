import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>pagepage()));
    utils().toastmess(value.user!.email.toString());}).onError((error, stackTrace) {setState(() {
      loading=false;
    });debugPrint(error.toString());utils().toastmess(error.toString());});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

            Text("OR",textAlign: TextAlign.center,style: TextStyle(color: Colors.blueGrey,fontSize: 18),),
            SizedBox(height:20 ,),
           Padding(
             padding: const EdgeInsets.only(left: 20.0,right: 20),
             child: ElevatedButton(
                 onPressed: (){googlelogin();},
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [Image.asset('assets/google_icon.png',height: 42),
                     Text("Login with Google",style: TextStyle(color: Color(0xff03002e),fontSize: 16,fontWeight: FontWeight.w500),)],
                 ),style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
             ),
           )
          ],
        ),
      ),
    );
  }
}


googlelogin() async
{
  GoogleSignInAccount?googleUser=await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
  AuthCredential credential=GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken:googleAuth?.idToken
  );
  UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);
    }