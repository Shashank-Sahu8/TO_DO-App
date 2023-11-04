import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/todo.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  getpp()
  {
    if(_auth.currentUser?.photoURL!=null)
      {
        return NetworkImage(_auth.currentUser!.photoURL.toString());
      }
    else
      {
        return AssetImage('assets/userimageimage-removebg-preview.png');
      }
  }

  getname()
  {
    if(_auth.currentUser?.displayName!=null)
      {
        return Text(_auth.currentUser!.displayName.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23));
      }
    else
      {
        return Text("Unknown User",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23));
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

  User?_user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Color(0xfffeebe6),
      child: ListView(
        children: [UserAccountsDrawerHeader(
          accountName:
          getname(),
          accountEmail:
          getemail(),
          currentAccountPicture: CircleAvatar(
            backgroundImage: getpp(),
            backgroundColor: Colors.blueGrey,
          ),
          decoration: BoxDecoration(
            color:Color(0xff03002e),

          ),
        ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.blueGrey,size: 30,),
            title: new Text("Home",style: TextStyle(fontSize: 20),),
            onTap: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>pagepage()))
            },
            splashColor: Colors.black87,
          ),


          ListTile(
            leading: Icon(Icons.contacts,color: Colors.blueGrey,size: 30,),
            title: new Text("Contact",style: TextStyle(fontSize: 20),),
            onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>pagepage()))},
            splashColor: Colors.black87,
          ),

          ListTile(
            leading: Icon(Icons.link,color: Colors.blueGrey,size: 30,),
            title: new Text("Usefull Links",style: TextStyle(fontSize: 20),),
            onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>pagepage()))},
            splashColor: Colors.black87,
          ),
          Expanded(child: SizedBox(height: 335,)),
          ListTile(
            leading: Icon(Icons.logout_sharp),
            title: Text("Log Out"),
            onTap: ()async{
              // LocalNotifications.showSimpleNotification(title: 'To_Do',body: 'Successful Log In',payload: 'hello');
              await _auth.signOut();
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>logintro()));
            }
          ),

        ],
      ),
    );
  }
}