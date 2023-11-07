import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
class show_event extends StatefulWidget {
  const show_event({super.key, required this.titleupdated, required this.descriptionupdated, required this.timetime});
  final String titleupdated,descriptionupdated,timetime;
  @override
  State<show_event> createState() => _show_eventState();
}
final _auth=FirebaseAuth.instance;
String uid=_auth.currentUser!.uid;
class _show_eventState extends State<show_event> {
  var titlecontroller=TextEditingController();
  var descriptioncontroller=TextEditingController();
  var time=DateTime.now();
  @override
  initState(){
    super.initState();
    titlecontroller=TextEditingController(text:widget.titleupdated!=''? widget.titleupdated:'');
    descriptioncontroller=TextEditingController(text: widget.descriptionupdated!=''?widget.descriptionupdated:'');
  }

  addtasktofirebase() async{
    // final _auth=FirebaseAuth.instance;
    // String uid=_auth.currentUser!.uid;
    //var time=DateTime.now();
    await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(time.toString()).set({'title':titlecontroller.text,'description':descriptioncontroller.text,'time':time.toString(),'timestamp':time});
    Fluttertoast.showToast(msg: 'Data Added');
  }

  updatetasktofirebase()async{

    //var time=DateTime.now();
    Fluttertoast.showToast(msg: 'Updated Successfully');
    await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(widget.timetime).update({'title':titlecontroller.text,'description':descriptioncontroller.text,});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfffeebe6),
      appBar: AppBar(elevation: 3,backgroundColor: Color(0xfffeebe6),
        leading: BackButton(color: Color(0xff03002e),),
        title: Text(widget.titleupdated!=''?'Update Task':'New Task',style:TextStyle(color: Color(0xff03002e),fontWeight: FontWeight.w600,fontSize: 26),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(

              children: [
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.blueGrey,
                  controller:titlecontroller,
                  decoration: InputDecoration(
                      hintText: "Title",
                      border: OutlineInputBorder( ),
                      icon: Icon(Icons.arrow_forward,color: Colors.blueGrey,)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextField(
                    maxLines: 5,
                    cursorHeight: 20,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.blueGrey,
                    controller: descriptioncontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Description",
                        icon: Icon(Bootstrap.keyboard,color: Colors.blueGrey,)),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),

                        Text(widget.titleupdated!=''?"Update Task":"Add Task",style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    onPressed: (){
                      widget.titleupdated!=''?updatetasktofirebase():addtasktofirebase();
                      //updatetasktofirebase();
                      //addtasktofirebase();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}