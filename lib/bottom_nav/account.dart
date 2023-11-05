import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  getpp()
  {
    if(_auth.currentUser?.photoURL!=null)
    {
      return NetworkImage(_auth.currentUser!.photoURL.toString());
    }
    else
    {
      return AssetImage('assets/9440461-removebg-preview.png');
    }
  }

  getname()
  {
    if(_auth.currentUser?.displayName!=null)
    {
      return Text(_auth.currentUser!.displayName.toString(),style: TextStyle(color:Color(0xff03002e),fontWeight: FontWeight.w600,fontSize: 21));
    }
    else
    {
      return Text("Unknown User",style: TextStyle(color:Color(0xff03002e),fontWeight: FontWeight.w600,fontSize: 21));
    }
  }
  getemail()
  {
    if(_auth.currentUser?.email!=null)
    {
      return Text(_auth.currentUser!.email.toString(),style: TextStyle(color: Colors.blueGrey,fontSize: 17));
    }
    else
    {
      return Text("Invalid email",style: TextStyle(color: Colors.blueGrey,fontSize: 17));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      appBar: AppBar(title: Text('Profile',style: GoogleFonts.lato(color: Color(0xff03002e),fontWeight: FontWeight.w700,fontSize: 26),),backgroundColor: Color(0xfffeebe6),automaticallyImplyLeading: false,elevation: 1,shadowColor: Colors.white60,),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:20.0,left: 16.0,right: 12.0),
          child: Row(
            children: [
              Expanded(child: CircleAvatar(backgroundColor: Colors.blueGrey,backgroundImage: getpp(),radius: 40,)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getname(),
                    getemail()
                  ],

                ),
              )
            ],
          ),
        ),

        Row(
          children: [
            Icon(Icons.logout),
            TextButton(onPressed: (){_auth.signOut();}, child: Text("Log Out"))
          ],
        )


      ],



    ),
    );
  }
}
