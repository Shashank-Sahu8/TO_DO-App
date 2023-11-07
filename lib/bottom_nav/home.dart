import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/description.dart';
import 'package:to_do/search.dart';

import '../add_event.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool sort=true;
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event(titleupdated: '', descriptionupdated: '', timetime: '',)));
      },child: Icon(Icons.add),backgroundColor:Color(0xff03002e) ),
      backgroundColor: Color(0xfffeebe6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Color(0xfffeebe6),
        elevation: 1,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              sort=!sort;
            });
          }, icon: Icon(Icons.sort_sharp,color: Color(0xff03002e))),
          IconButton(onPressed: (){showSearch(context: context, delegate: Search());}, icon: Icon(Icons.search,color: Color(0xff03002e),)),
          SizedBox(width: 10,),
        ],
        title: Text('Tasks',style: GoogleFonts.lato(fontSize: 26,fontWeight:FontWeight.w900,color: Color(0xff03002e)),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(stream:FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').snapshots() ,
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
                  reverse: sort!=true?true:false,
                  itemCount: docs.length,
                  itemBuilder: (context,index){
                    var time=(docs[index]['timestamp'] as Timestamp).toDate();
                    return Dismissible(
                      background: Padding(
                        padding: const EdgeInsets.only(top: 17.0,bottom: 1),
                        child: Container(
                          color: CupertinoColors.systemGreen,
                        ),
                      ),
                      secondaryBackground: Padding(
                        padding: const EdgeInsets.only(top: 17.0,bottom: 1),
                        child: Container(
                          color: Colors.redAccent,
                        ),
                      ),
                      onDismissed: ( direction){
                        if(direction==DismissDirection.startToEnd)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event(titleupdated: docs[index]['title'], descriptionupdated: docs[index]['description'], timetime: (docs[index]['time']).toString(),)));
                        }
                        else if(direction==DismissDirection.endToStart)
                        {
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              iconColor: Color(0xff03002e),
                              title: Text('Delete item?'),
                              actions: [
                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){ FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(docs[index]['time']).delete();Fluttertoast.showToast(msg: 'Item Deleted');Navigator.pop(context);}, child:Text('Delete') ),
                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
                              ],
                            );
                          });
                        }
                      },
                      key: Key(index.toString()),
                      child: InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>description(title:docs[index]['title'], des: docs[index]['description'], time: DateFormat.yMd().add_jm().format(time) ,)));},
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
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(DateFormat.yMd().add_jm().format(time)),
                                            //Text((docs[index]['time']).toString()),
                                            Text(docs[index]['title'],style: GoogleFonts.roboto(fontSize: 19,fontWeight: FontWeight.bold,color: Color(0xff03002e)))
                                          ],
                                        ),
                                        Expanded(child: SizedBox(width: 100,)),
                                        IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>show_event(titleupdated: docs[index]['title'], descriptionupdated: docs[index]['description'], timetime: (docs[index]['time']).toString(),)));}, icon: Icon(Icons.edit)),
                                        IconButton(onPressed: (){
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              iconColor: Color(0xff03002e),
                                              title: Text('Delete item?'),
                                              actions: [
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){ FirebaseFirestore.instance.collection('tasks').doc(uid).collection('mytasks').doc(docs[index]['time']).delete();Fluttertoast.showToast(msg: 'Item Deleted');Navigator.pop(context);}, child:Text('Delete') ),
                                                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
                                              ],
                                            );
                                          });
                                        }, icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.blueGrey,),
                                  Row(
                                    children: [
                                      Text('Description: '),
                                      //Expanded(child: Text(docs[index]['description'])),
                                    ],
                                  )
                                ],
                              ),
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
      ),
    );
  }
}
//Text(DateFormat.yMd().add_jm().format(time))
// Text(docs[index]['title'],style: GoogleFonts.roboto(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff03002e))