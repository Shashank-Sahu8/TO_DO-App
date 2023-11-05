// ignore_for_file: camel_case_types
import 'package:icons_plus/icons_plus.dart';
import 'package:to_do/Sign/if_logedin.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:to_do/Sign/log_intro.dart';
import 'package:to_do/todo.dart';
class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}
class CartController extends GetxController{
  var _product={}.obs;
  void addProduct(i){
    Get.snackbar("Product Added", "You have apped the ${i}",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2)
    );
  }
}
class _page_1State extends State<page_1> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user=event;
      });
    });
  }
  int c_index=0;
  List imageList =[
    {"id":1,"image_path":'assets/toimage-removebg-preview.png'},
    {"id":2,"image_path":'assets/todo_image3-removebg-preview.png'},
    {"id":3,"image_path":'assets/todo_image4-removebg-preview.png'},
  ];
  final cartController=Get.put(CartController());
  final CarouselController carouselController = CarouselController();
  int car_currentindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeebe6),
      appBar: AppBar(
        backgroundColor: Color(0xfffeebe6),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>islogein()));},
              child: Text("Skip",style: TextStyle(color: Color(0xff03002e)),)),
        ],

      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items:  imageList.map(
                  (item)=>Image.asset(item['image_path'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ) .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,

                aspectRatio: 1.4,
                viewportFraction: 1,
                onPageChanged: (index,reason){
                  setState(() {
                    car_currentindex=index;
                  });
                }
            ),
          ),
            new DotsIndicator(
              decorator: DotsDecorator(activeColor: Color(0xff03002e)),
            dotsCount: imageList.length,
            position: car_currentindex,
            ),
          SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('To_Do',style: TextStyle(color: Color(0xff03002e),fontSize: 26,fontWeight: FontWeight.w600),)
            ],
          ),
          SizedBox(height: 20
            ,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Bootstrap.dot),
                      Text("Unable to manage your time ?"),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Bootstrap.dot),
                      Text("Still confused ?"),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Bootstrap.dot),
                      Text("Relax !"),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 60.0,right: 60),
            child: Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor:Color(0xff03002e),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),minimumSize: Size(50, 50)),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>islogein()));},
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward),
                      Text("Get Started"),
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
