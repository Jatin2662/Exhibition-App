import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel{
  final String name;
  final String description;


  const UserModel({
    required this.name,
    required this.description,
});

  toJson(){
    return { "name": name, "description": description};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> document){
    final data = document.data()!;
    // final data = document
    return UserModel(name: data['name'], description: data['description'],);
  }
}



// class GetData extends StatefulWidget {
//   const GetData({Key? key}) : super(key: key);
//
//   @override
//   State<GetData> createState() => _GetDataState();
// }
//
// class _GetDataState extends State<GetData> {
//   final db = FirebaseFirestore.instance;
//   // final users = db.collection("users");
//
//   Future<List> allDocument() async{
//     // db.collection("cities").get().then(
//     //       (querySnapshot) {
//     //     for (var docSnapshot in querySnapshot.docs) {
//     //
//     //     }
//     //   },
//     //   // onError: (e) => print("Error completing: $e"),
//     // );
//     final snapshot = await db.collection('users').get();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//     );
//   }
//
//
// }
