import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../add_event.dart';
import '../description.dart';

class progress extends StatefulWidget {
  const progress({super.key});

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
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
  // getuid()
  // {
  //   FirebaseAuth _auth=FirebaseAuth.instance;
  //   setState(() {
  //     uid=_auth.currentUser!.uid;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress',style: GoogleFonts.lato(color: Color(0xff03002e),fontWeight: FontWeight.w700,fontSize: 26),),backgroundColor: Color(0xfffeebe6),automaticallyImplyLeading: false,elevation: 1,shadowColor: Colors.white60,),
      backgroundColor: Color(0xfffeebe6),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text('Worke Done :',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 18.0,
                      animation: true,
                      percent: 0.7,
                      center: new Text(
                        "70.0%",
                        style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Text('Efficiency :',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 18.0,
                      animation: true,
                      percent: 0.7,
                      center: new Text(
                        "70.0%",
                        style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                ),
                   ],
                 ),
                SizedBox(height: 15,),
                Divider(),
                SizedBox(height: 15,),
                Text("Completed Tasks :",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500)),
                SizedBox(height: 20,),

            Container(
              height: (MediaQuery.of(context).size.height)*(2/3),
              width: MediaQuery.of(context).size.width,
              child:StreamBuilder(stream:FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').snapshots() ,
                builder: (context,snapshots){
                  if(snapshots.connectionState==ConnectionState.waiting)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else
                  {
                    final docs=snapshots.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 15,),
                      child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context,index){
                          var time=(docs[index]['timestamp'] as Timestamp).toDate();
                          return docs[index]['state'].toString()=='false'?Text(""):InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>description(title:docs[index]['title'], des: docs[index]['description'], time:docs[index]['time'], state: docs[index]['state'].toString() ,)));},
                            child: Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.grey,borderRadius:BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0,bottom: 8),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.do_not_disturb_on_total_silence_outlined,size: 10,),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(DateFormat.yMd().add_jm().format(time)),
                                                  Container(child: Text(docs[index]['title'].toString().length<13?docs[index]['title'].toString():(docs[index]['title'].toString().substring(0,13)+'....'),style: GoogleFonts.roboto(fontSize: 19,fontWeight: FontWeight.bold,color: Color(0xff03002e))))
                                                ],
                                              ),
                                            ),

                                            Expanded(child: SizedBox(width: 100,)),
                                            Icon(Bootstrap.check2_circle,color: Color(0xff027148),),
                                            SizedBox(width: 10,)
                                          ],
                                        ),
                                      ),
                                      Divider(color: Colors.blueGrey,),
                                      Row(
                                        children: [
                                          Text('Description: '),
                                           ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            )


            ],),
          ),
        ),
      ),
    );
  }
}




