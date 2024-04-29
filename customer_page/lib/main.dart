import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  var arrDays = ["1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8","1", "2", "3", "4", "5", "6", "7", "8"];
  var plot = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  var company_name = [
    "kadoo",
    "aloo",
    "gobhi",
    "pyaaz",
    "tamattar",
    "matar",
    "bhindi",
    "kheera",
    "gajjar",
    "mooli"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("customer9"),

      ),
      backgroundColor: Colors.purpleAccent,
      body: Container(
        // color : Colors.purple,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("okay"),
            // Container(
            //   height:100,
            //   width:200,
            //   color: Colors.blue,),
            Expanded(
              flex : 2,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                    // height: 200,
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      // border:Border.all()
                    ),

                    child: (
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (Context, index) {
                            return Padding(
                              padding : EdgeInsets.all(10),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Text(arrDays[index]),
                                  )

                              ),
                            );
                          },
                          itemCount: arrDays.length,
                        )
                    )
                ),
              ),
            ),
            Expanded(
              flex : 9,
              child: Padding(
                padding : EdgeInsets.all(15),
                child: Container(
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height:
                    child: ListView.separated(
                      itemBuilder: (Context, index) {
                        return ListTile(
                          leading: Text(plot[index]),
                          title: Text(company_name[index]),
                          // subtitle:,
                          trailing: Icon(Icons
                              .icecream_rounded), //yahan par icon button lga denge jo plot khol dega new page main aur us plot ki jankari dal dennnge us main
                        );
                      },
                      itemCount: plot.length,
                      separatorBuilder: (context, index) {
                        return Divider(height: 10, thickness: 4,);
                      },


                    )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


