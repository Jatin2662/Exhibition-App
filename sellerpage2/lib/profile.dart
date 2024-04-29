import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellerpage2/product__description.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sellerpage2/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String person_name = '';
  String name_company = '';
  String person_number = '';
  // static SharedPreferences prefs;

  @override
  void initState(){
    super.initState();
    // getValue();
    setState(() {

    });
    // person_name= preferences.getname() ?? " ";
    // name_company = preferences.getcompany() ?? " ";
    // person_number=preferences.getnumber() ?? " ";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
          children:[
            Expanded(
              flex : 2,
              child:Container(),
            ),
            Expanded(
              flex:7,
              child:Container(

                child:SingleChildScrollView(
                  child: Column(
                      children:[
                        TextFormField(
                            initialValue : person_name,
                            textInputAction:TextInputAction.next,
                            decoration:InputDecoration(
                              labelText:"Representative Name",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(5),
                                  borderSide:BorderSide(
                                    color:Colors.black,
                                    width:2,
                                  )
                              ),
                              prefixIcon:Icon(Icons.person),
                            ),
                          onChanged:(person_name) => setState(() {
                            this.person_name=person_name;
                          })
                        ),
                        SizedBox(
                          height:10,
                        ),
                        TextFormField(
                            initialValue:name_company,
                          textInputAction:TextInputAction.next,
                            decoration:InputDecoration(
                              labelText:"Company Name",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(5),
                                  borderSide:BorderSide(
                                    color:Colors.black,
                                    width:2,
                                  )
                              ),
                              prefixIcon:Icon(Icons.icecream_rounded),
                            ),
                          onChanged: (name_company) => setState(() {
                            this.name_company=name_company;
                          }) ,
                        ),
                        SizedBox(
                          height:10,
                        ),
                        TextFormField(
                            initialValue: person_number,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            maxLength: 10,
                          textInputAction:TextInputAction.done,
                            decoration:InputDecoration(
                                labelText:"Contact no.",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(5),
                                    borderSide:BorderSide(
                                      color:Colors.black,
                                      width:2,
                                    )
                                ),
                                prefixIcon:Icon(Icons.phone),
                              // suffixText: "" //country code ke liye
                            ),
                          onChanged: (person_number)=> setState(() {
                            this.person_number=person_number;
                          }),
                        ),
                        Text("$person_name"),
                        Text("$name_company"),
                        Text("$person_number"),



                      ]
                  ),
                ),
              ),
            ),
            SizedBox(
              height:10,
            ),
            Expanded(
                flex:1,
                child:ElevatedButton(
                    onPressed:() async{
                      // await preferences.setPerson(person_name);
                      // await preferences.setCompany(name_company);
                      // await preferences.setNumber(person_number);
                    },
                    child:Text("Save")
                )
            )
          ]
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
