import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:to_do/Sign/SignUp.dart';
import 'package:to_do/Sign/gsign.dart';
import 'package:to_do/Sign/ifloginlogin.dart';
import 'package:to_do/Sign/is.dart';
import 'package:to_do/Sign/login.dart';
import 'package:to_do/todo.dart';

class logintro extends StatefulWidget {
  const logintro({super.key});

  @override
  State<logintro> createState() => _logintroState();
}

class _logintroState extends State<logintro> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 // User? _user;

  // void loginn() {
  //   googlelogin();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => pagepage()));
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _auth.authStateChanges().listen((event) {
  //     setState(() {
  //       _user = event;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              child: Image.asset('assets/img-removebg-preview.png'),
            ),
            SizedBox(height: 20,),
            Text("Welcome", style: TextStyle(color: Color(0xff03002e),
                fontSize: 43,
                fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              child: Text("Stay organised and live stress free with To Do app",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff03002e),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => islogelogin()));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: 53,
                  width: 285,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Login', textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),),
                      ],
                    ),
                  )),
                  decoration: BoxDecoration(color: Color(0xff03002e),
                      borderRadius: BorderRadius.circular(25)),
                ),

              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 5,
                    minimumSize: Size(290, 50),
                    primary: Color(0xfffeebe6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(width: 2, color: Color(0xff03002e)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => issignin()));
                },
                child: Text('Sign Up', textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff03002e),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),)
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: Colors.grey,thickness: 0.6,)),
                  SizedBox(width: 3,),
                  Text("Or continue with", style: TextStyle(color: Colors.blueGrey, fontSize: 14),),
                  SizedBox(width: 3,),
                  Expanded(child: Divider(color: Colors.grey,thickness: 0.6,)),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  elevation: 2,
                  onPressed: () {
                    showDialog(context: context, builder: (context){return const Center(child: CircularProgressIndicator(),);});
                    AuthServices().signInWithGoogle();
                    Navigator.pop(context);Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset('assets/google_icon.png', height: 42),
                  ),),
                FloatingActionButton.small(
                  elevation: 2,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(Bootstrap.facebook,size: 30, color: Color(0xff03002e),),),
              ],
            )

          ],
        ),
      ),);
  }
}


  // googlelogin() async
  // {
  //   GoogleSignInAccount?googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken
  //   );
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .signInWithCredential(credential);
  //   print(userCredential.user?.displayName);
  //   return userCredential.user?.displayName;
  //   //if(userCredential.currentState!.validate()){}
  // }
  //
  // facebooklogin() async
  // {
  //   ////if(_formfield.currentState!.validate()){
  //
  // }

//
// Future<void> _handleSignIn() async {
//   try {
//     await googlelogin();
//   } catch (error) {
//     utils().toastmess(error.toString());
//     print(error);
//   }
// }

// Future<void>_handlefacebook() async{
//   try {
//     await googlelogin();
//   } catch (error) {
//     utils().toastmess(error.toString());
//     print(error);
//   }
// }

// utils{
//
//   toastmess(String message)
//   {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.grey[700],
//         textColor: Color(0xffffd954),
//         fontSize: 12.0
//     );
//   }
//
// }


