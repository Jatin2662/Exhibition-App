import 'package:flutter/material.dart';
import 'product_description.dart';
import 'SellerNextPage.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}
final number_of_products = TextEditingController();
var products;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
/*TextField(
decoration: InputDecoration(
hintText: "Product ${index + 1}}",
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(2),
borderSide: BorderSide(
color: Colors.black,
width: 3,
)
)
)
);*/

/*class Products extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        color: Colors.brown,
        child:
      ),


    );
  }
}*/
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_MyHomePageState();

  }
  class _MyHomePageState extends State<MyHomePage>{

  var representative_name = TextEditingController();
  var company_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("SELLER"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(height: 100,
              child: Column(
                children: [
                  Text("Your Profile", style: TextStyle(fontSize: 20,)),
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                  ),

                ],
              ),),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: ListView(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                        height: 30),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Company Name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              )
                          ),
                          prefixIcon: Icon(Icons.lock),
                        )
                    ),
                    SizedBox(
                        height: 30),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: number_of_products,
                      decoration: InputDecoration(
                          labelText: "No. of Product[s]",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Icon(Icons.icecream_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            onPressed: () {
                              products = number_of_products.text.toString();

                                Navigator.push(context,MaterialPageRoute(builder: ( Context)=>ProductDescription(int.parse(products))));


                            },
                          )
                      ),
                    ),
                  ]
              ),
            ),

          ),
        ],
      ),
    );
  }
}





