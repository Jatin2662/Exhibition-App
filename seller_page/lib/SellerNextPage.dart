// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(MyApp());
// }
// dynamic ducts;
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Products(),
//     );
//   }
// }
// class Products extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body:Container(
//                   child:ListView.builder(itemBuilder:(Context,index) {
//                     return TextField(
//                         decoration: InputDecoration(
//                             hintText: "Product ${index + 1}}",
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(2),
//                                 borderSide: BorderSide(
//                                   color: Colors.black,
//                                   width: 3,
//                                 )
//                             )
//                         )
//                     );
//                   },
//                     itemCount: 4,
//                   )
//               ),
//
//     );
//   }
// }