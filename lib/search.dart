import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do/description.dart';


class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){query='';},
          icon:const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){close(context, null);}, icon: const Icon(Icons.arrow_back));
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    FirebaseAuth _auth=FirebaseAuth.instance;
    return StreamBuilder(stream:FirebaseFirestore.instance.collection('tasks').doc(_auth.currentUser!.uid).collection('mytasks').snapshots() ,
        builder: (context,snapshots){
          final docss=snapshots.data!.docs;
      return ListView.builder(
        itemCount: docss.length,
        itemBuilder: (context,index){
          // final docs=query.isEmpty?docss:docss.where((p)=>p[index]['title'].toString().startsWith(query[0].toUpperCase())).toList();
           var time=(docss[index]['timestamp'] as Timestamp).toDate();
          // return docs.isEmpty?Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Text('No such result found...',style: TextStyle(color: Colors.grey,fontSize: 18),),
          // ):
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>description(title:docss[index]['title'], des: docss[index]['description'], time: DateFormat.yMd().add_jm().format(time) ,)));
            },
            title: Padding(
              padding: const EdgeInsets.only(top:6.0,),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(docss[index]['title'],style: TextStyle(fontSize: 15),),
                      Icon(Icons.touch_app_rounded)
                    ],
                  ),
                  Align(alignment: Alignment.centerLeft,child: Text(DateFormat.yMd().add_jm().format(time),style: TextStyle(),)),
                  Divider(color: Colors.grey,)
                ],
              ),
            ),);
        }
    );
  }
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query,style: TextStyle(color: Colors.grey,fontSize: 20),),);
  }

}
