import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class description extends StatefulWidget {
  const description({super.key, required this.title, required this.des, required this.time, required this.state});
  final String title,des,time,state;
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

  addcompletedtasktofirebase() async{
     final _auth=FirebaseAuth.instance;
     String uid=_auth.currentUser!.uid;
    var timee=DateTime.now();
    await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('completedtasks').doc(timee.toString()).set({'title':widget.title.toString(),'description':widget.des.toString(),'time':timee.toString(),'timestamp':timee});
     widget.state.toString()=='true'?Fluttertoast.showToast(msg: 'Task set to Incomplete'):Fluttertoast.showToast(msg: 'Task Completed');
  }

  updatecompletetasktofirebase()async{

    //var time=DateTime.now();
    //Fluttertoast.showToast(msg: 'Updated Successfully');
    await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(widget.time).update({'state':widget.state!='true'?true:false});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      appBar: AppBar(
          leading: BackButton(color: Color(0xff03002e),),
          elevation: 1,
          title: Text("Description",style: GoogleFonts.lato(fontSize: 26,fontWeight:FontWeight.w900,color: Color(0xff03002e)),),
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
              widget.state.toString()=='true'?Text("Completed Task : "):Text("Task Description : "),
              SizedBox(height: 5,),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(left:100.0),
                child: Text(widget.des,style: TextStyle(fontSize: 18),),
              )),
              Expanded(child: SizedBox(height: 2000,)),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    addcompletedtasktofirebase();
                    updatecompletetasktofirebase();
                    Navigator.pop(context);
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),minimumSize: Size(100, 45)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.state.toString()=='true'?Icon(Icons.question_mark_sharp):Icon(Icons.done_all_rounded),
                      widget.state.toString()=='true'?Text("Task Still Left"):Text("Task Completed"),
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}

