import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class description extends StatefulWidget {
  const description({super.key, required this.title, required this.des, required this.time});
  final String title,des,time;
  @override
  State<description> createState() => _descriptionState();
}
class _descriptionState extends State<description> {
  String uid='';
  @override
  void initState() {
    getuid();
    super.initState();
  }
  getuid()
  {
    FirebaseAuth _auth=FirebaseAuth.instance;
    setState(() {
      uid=_auth.currentUser!.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03002e),
        appBar: AppBar(
        leading: BackButton(color: Color(0xff03002e),),
          elevation: 1,
          // actions: [IconButton( onPressed:(){
          //    FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(widget.time).delete();
          //   Navigator.pop(context);
          //   },icon: Icon(Icons.delete))],
          backgroundColor: Color(0xfffeebe6)
      ),
      body:Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title,style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 26),),
                ],
              ),
              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 10,),
              Text("Description : "),
              SizedBox(height: 5,),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text(widget.des,style: TextStyle(fontSize: 18),),
              ))
            ],
          ),
        ),
      ),

    );
  }
}



































































// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class description extends StatefulWidget {
//   const description({super.key, required this.title, required this.descriptionn, required this.time});
//   final String title,descriptionn,time;
//
//   @override
//   State<description> createState() => _descriptionState();
// }
//
// class _descriptionState extends State<description> {
//   String uid='';
//   @override
//   void initState() {
//     getuid();
//     super.initState();
//   }
//
//   getuid()
//   {
//     FirebaseAuth _auth=FirebaseAuth.instance;
//     setState(() {
//       uid=_auth.currentUser!.uid;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffeebe6),
//       appBar: AppBar(
//         leading: BackButton(color: Color(0xff03002e),),
//           elevation: 1,
//           actions: [IconButton(onPressed: ()async{await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(docs[index]['time']).delete(), icon: Icon(Icons.delete))],
//           backgroundColor: Color(0xfffeebe6)
//         //automaticallyImplyLeading: false,
//         //leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_new_sharp),),
//       ),
//     );
//   }
// }
