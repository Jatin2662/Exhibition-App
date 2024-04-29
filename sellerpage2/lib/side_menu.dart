import 'package:flutter/material.dart';
import 'package:sellerpage2/main.dart';
import 'package:sellerpage2/product__description.dart';
import 'package:sellerpage2/profile.dart';
import 'package:sellerpage2/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SideMenu extends StatefulWidget{
  const SideMenu({super.key});

  @override
  State<StatefulWidget> createState()=> _SideMenuState();
}
class _SideMenuState extends State<SideMenu>{
   String person_name = '';
   String name_company ='';
  // String person_number = '';
  @override
  void initState() {
    super.initState();
    // getValue();
    setState(() {
      // person_name= preferences.getname() ?? "your name";
      // name_company = preferences.getcompany() ?? "company name";
      // // person_number=preferences.getnumber() ?? " ";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        width:250,
        height:double.infinity,
        color: Colors.blue,
        child:SafeArea(
          child:Column(
            children:[
              ListTile(
                leading: const CircleAvatar(
                  radius:20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person,
                  color: Colors.white,)
                ),
                title:Text("$name_company"),
                subtitle: Text("$person_name"),
                trailing: Icon(Icons.edit),
                  onTap: ()=> Navigator.pushNamed(context, 'profile'),
                ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0), // all ya only use karlo
                    child: Divider(
                      color: Colors.white,
                      height:1,
                    ),
                  ),
                  ListTile(
                    // onTap: (){}, //yahan par navigation lga denge
                    leading: const Icon(Icons.icecream_rounded),
                    title: const Text("Products"),
                    trailing:const Icon(Icons.arrow_forward_ios_sharp),
                      onTap:()=>Navigator.pushNamed(context, 'productDescription'),
                  ),
                ],
              ),

            ]
          ),
        ),
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