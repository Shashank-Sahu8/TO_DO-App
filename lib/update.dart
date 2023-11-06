// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'add_event.dart';
//
// updatetasktofirebase()async{
//
//   //var time=DateTime.now();
//   Fluttertoast.showToast(msg: 'Updated Successfully');
//   await FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(time.toString()).update({'title':titlecontroller.text,'description':descriptioncontroller.text,'time':time.toString(),'timestamp':time});
//
// }