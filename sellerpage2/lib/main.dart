// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellerpage2/images.dart';
import 'dart:convert';

import 'package:sellerpage2/product__description.dart';
import 'package:sellerpage2/profile.dart';
import 'package:sellerpage2/start.dart';
import 'package:sellerpage2/preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'side_menu.dart';


void main(){
  // CollectionReference products = FirebaseFirestore.instance.collection('products');
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  int j;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: 'start',
      routes: {'start' : (context)=>Start(),
        'sideMenu': (context)=> SideMenu(),
        'profile':(context)=> ProfilePage(),
        'productDescription' : (context)=> ProductDescription(),
        'images':(context)=>MultipleImageUpload(j),
      },
      home: Start(),
    );
  }

}




