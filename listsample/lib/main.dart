import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List A = ["1","2","3","4","5","6"];

  List A1 = ["1"];

  List B = ["7","8","9","10","11","12","13","14","15","16","17"];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body:  Padding(
        
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Text("List View"),
              flex:2,
            ),
            Expanded(
              flex:8,
              child: ListView.separated(itemBuilder: (context,index){
                     return Container(
                       height: 200,
                       decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(4)
                       ),

                       child:  ListView.separated(itemBuilder: (context,ind){
                              return Text("${A[index]} --> ${B[ind]}");
                              }, separatorBuilder: (context,ind){
                              return Divider(height:2);
                              }, itemCount: B.length),
                     );
                     }, separatorBuilder: (context,index){
                     return Divider(height:5,);
                     }, itemCount: A.length),
            ),
          ],
        ),
      )
    );
  }
}

// ListView.separated(itemBuilder: (context,ind){
// return Text("${B[ind]}");
// }, separatorBuilder: (context,ind){
// return Divider(height:2);
// }, itemCount: B.length);

// ListView(
// children: [
// Container(
// height: 200,
// child: ListView.separated(itemBuilder: (context,index){
// return Text("${B[index]}");
// }, separatorBuilder: (context,index){
// return Divider(height:5);
// }, itemCount: B.length),
// ),
// Container(
// height: 200,
// child: ListView.separated(itemBuilder: (context,ind){
// return Text("${B[ind]}");
// }, separatorBuilder: (context,ind){
// return Divider(height:2);
// }, itemCount: B.length),
// ),
// ],
// )


