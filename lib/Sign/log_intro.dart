import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/Sign/SignUp.dart';
import 'package:to_do/Sign/login.dart';

class logintro extends StatefulWidget {
  const logintro({super.key});

  @override
  State<logintro> createState() => _logintroState();
}

class _logintroState extends State<logintro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Container(
              child: Image.asset('assets/img-removebg-preview.png'),
            ),
            SizedBox(height: 45,),
            Text("Welcome",style: TextStyle(color: Color(0xff03002e),fontSize: 43,fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:60.0,right: 60.0),
              child: Text("Stay organised and live stress free with To Do app",textAlign: TextAlign.center,style:TextStyle(color: Color(0xff03002e),fontSize:15 ,fontWeight: FontWeight.w400) ,),
            ),
            SizedBox(height: 100,),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));},
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: 45,
                  width: 250,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign Up',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                        Icon(Icons.arrow_right_alt ,color: Colors.white,)
                      ],
                    ),
                  )),
                  decoration: BoxDecoration(color: Color(0xff03002e),borderRadius: BorderRadius.circular(25)),
                ),

              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have the account?',style: TextStyle(color: Color(0xff03002e),fontSize: 12),),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));}, child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
