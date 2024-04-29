

import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget{
  var value;
  ProductDescription (this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemBuilder : (Context,index){
            return TextField(

              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines:10,
              decoration: InputDecoration(
                  labelText:"product${index+1}",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color : Colors.black,
                    width:2,
                  )
                )
              ),
            );

          },
          itemCount: value,),
        ),
      )
    );
  }

}