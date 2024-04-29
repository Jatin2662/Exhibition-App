import 'dart:core';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  final userref = FirebaseFirestore.instance.collection('users');


  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;

  @override
  void initState() {
    super.initState();
    uid = user?.uid ?? "";
    fetchUserData();
    getusers();
    getproducts();
    setState(() {});
  }
  List ids = [];
  Future<List> getusers() async {
    await userref.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        // print(doc.id);
        ids.add(doc.id);
        // print(ids);
      });
    });
    return ids;
  }
  late final CollectionReference usersCollection;

  List productID=[];
  Future<List> getproducts() async {
    // usersCollection.get().then((QuerySnapshot querySnapshot) {
    //   collectionLength = querySnapshot.size;
    //   print('Collection length: $collectionLength');
    // });
      await FirebaseFirestore.instance.collection('users').doc().collection('products').get().then((DocumentSnapshot documentSnapshot) {
        documentSnapshot.docs.forEach((DocumentSnapshot doc) {
          // print(doc.id);
          ids.add(doc.id);
          // print(ids);
        });
      }
       );

    return productID;
  }
  // final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  int collectionLength = 0;



  void fetchUserData() {
    db
        .collection("users")
        .doc("A7QQf6TrRFaDD96v6FYMIuDQSj82")
        .collection("product1")
        .doc("Product1 value")
        .get()
        .then((doc) {
      if (doc.exists) {
        String name = doc.get("name");
        String description = doc.get("description");
        print("Name: $name, Description: $description");
      } else {
        print("No such document!");
      }
    }).catchError((error) {
      print("Error getting document: $error");
    });
  }

  @override
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  final auth = FirebaseAuth.instance;
  var search=TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate.toString();
      });
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExhiBit"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              _selectDate(context);
            },
          )
        ],
      ),
      drawer: Container(
        width: 250,

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              width: 40,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: const Text("LogOut"),
              onTap: () {
                setState(() {
                  auth.signOut();
                });
                Navigator.pushNamed(context, 'login');
              },
            ),
            ListTile(
              title: const Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, 'shop');
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: getusers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List ids = snapshot.data as List;
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 320,
                      height: 50,
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(ids[0]),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}