import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sellerpage2/profile.dart';
import 'package:sellerpage2/side_menu.dart';
import 'package:sellerpage2/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Start extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _StartState();
}



class _StartState extends State<Start>{
  var Days=["April,15","April,16","April,17","April,18","April,19","April,20",];
    Future<int>? data ;
  // String person_name = '';
  // String name_company ='';
  @override
  void initState() {
    super.initState();
    data= getdata() ;
    // getValue();
    setState(() {
      // person_name= preferences.getname() ?? "your name";
      // name_company = preferences.getcompany() ?? "company name";
      // // person_number=preferences.getnumber() ?? " ";
    });

  }
  Future<int>? getdata() async{
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SideMenu(),
        body:Column(

          children: [
            Container(
              height:300,
              width:double.infinity,
              child:GridView.builder( itemBuilder:(context,index){
                return Padding(
                    padding : const EdgeInsets.all(5),
                    child: Container(
                      color: Colors.black12,
                        child: TextButton(onPressed: (){}, child: Text('${Days[index]}'))));
              },
                itemCount: Days.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  // crossAxisCount: 3,
                  maxCrossAxisExtent: 100,
                ),


              )
            ),
            FutureBuilder(
              future:data,
                builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child:CircularProgressIndicator());
                }
                else {
                  return Center(child:Text("$data"));
                }

                })
          ],
        ),


    );
  }
  // Future getValue() async{
  //   await preferences.init();
  //   setState(() {
  //
  //   });
  // }


}
