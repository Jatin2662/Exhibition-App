import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  // final String id;
  // DatabaseServices({this.id});
  // final  MyProducts = FirebaseFirestore.instance.collection('products').doc('id');
  // Future<void> addProduct(String name,String information )async {
  //   return await MyProducts.;
  // }
  final db = FirebaseFirestore.instance;
   void addData_setADocument()  {
    // [START add_data_set_document_1]
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA"
    };

    db
        .collection("cities")
        .doc("LA")
        .set(city)
        .onError((e, _) => print("Error writing document: $e"));
    // [END add_data_set_document_1]
  }

  void addData_setADocument2() {
    // [START add_data_set_document_2]
    // Update one field, creating the document if it does not already exist.
    final data = {"capital": true};

    db.collection("cities").doc("BJ").collection('collectionPath').doc().set(data, SetOptions(merge: true));
    // [END add_data_set_document_2]
  }
}
// Future<void> addProduct(ProductDescription product) {
//   final CollectionReference products = FirebaseFirestore.instance.collection('products');
//   return products.add({
//     'name': product.product_name,
//     'information': product.product_value,
//     // 'price': product.price,
//     // 'imageURL': product.imageURL,
//   });
// }