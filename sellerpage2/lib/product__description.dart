
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

import 'DatabaseServices.dart';
import 'images.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


var product_value = TextEditingController();
var product_name=TextEditingController();
int j=1;

// final db = FirebaseFirestore.instance;



class ProductDescription extends StatefulWidget{
  const ProductDescription({super.key});
  @override
  State <ProductDescription> createState()=> _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>{

  DateTime? datePicked;
  bool active = true;
  @override
  void initState() {
    super.initState();
  }
  // CollectionReference products = FirebaseFirestore.instance.collection('products');
  // final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(

      ),

        body: Column(
            children:[
              const Expanded(
                flex:1,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                  child: Text("Describe your Product",style: TextStyle(fontSize: 20,))
          ),
                ),
              ),
              Expanded(
                flex:2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller:product_name,
                    decoration:InputDecoration(
                      labelText:"Product Name",
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(3),
                        borderSide:const BorderSide(
                          color:Colors.black,
                          width:2,
                        )
                      ),
                    )
                  ),
                ),
              ),
                  Expanded(
                    flex:1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('${datePicked?.day}/${datePicked?.month}/${datePicked?.year}'),
                        SizedBox(width:30),
                        ElevatedButton(onPressed:() async {
                          DateTime? datePicked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2023,6));
                          setState(() {
                            this.datePicked = datePicked;
                          });
                        }, child:Icon(Icons.calendar_month_rounded)),
                      ],
                    ),
                  ),

                  Expanded(
                    flex:4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                            child:TextField(
                              controller : product_value,
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                maxLines:10,
                            decoration:InputDecoration(
                              labelText:"Description",
                              enabledBorder:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide:const BorderSide(
                                  color:Colors.black,
                                  width:2,
                                )
                              ),
                            ),

                            ),
                      ),
                    ),
                  ),
              Expanded(
                  flex:1,
                  child:ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> MultipleImageUpload(j)));
                        // Navigator.pushNamed(context,'images');
                      },

                      child:const Text("ADD IMAGES")
                  )
              ),
              Expanded(
                flex:1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    ElevatedButton(
                    onPressed: active ? () async{
                      // print("Submitted");
                       // CollectionReference products = FirebaseFirestore.instance.collection('products').collection('products1');
                      // CollectionReference products = FirebaseFirestore.instance.collection('products');
                        setState(() {
                          active = !active;
                        });
                        final db = FirebaseFirestore.instance;

                        db
                            .collection("products")
                            .doc("user$j")
                            .collection('product1')
                            .doc('description')
                            .set({'name' : product_name.text.toString(), 'description':product_value.text.toString()});

                        // print('done');




                      // await products1.add({'name' : product_name.text.toString(), 'description':product_value.text.toString()});
                      // print();
                    } : null ,  child: Text("Submit")
                ),
                    const SizedBox(
                      width:20,
                    ),
                    ElevatedButton(
                        onPressed:(){
                          print(product_value.text.toString());
                          print(product_name.text.toString());
                          setState((){
                            // clear karna hai text field bas
                            active = !active;
                            product_value.clear();
                            product_name.clear();
                            j++;
                             ProductDescription();
                          });

                },
                    child: Text("Add another")
                ),

                  ]
                ),
              )
            ]
          ),

    );
     
  }

  // Widget buildFileImage()=> Image.file(fileimage as File,);

}
