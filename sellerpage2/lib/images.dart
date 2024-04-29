import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sellerpage2/product__description.dart';

class MultipleImageUpload extends StatefulWidget {
  int j;
  MultipleImageUpload( this.j);


  @override
  _MultipleImageUploadState createState() => _MultipleImageUploadState();
}
class _MultipleImageUploadState extends State<MultipleImageUpload> {
  // var valuefromdescription;
  // MultipleImageUpload extends(this.valuefromdescription);
  List<File> _imageList = [];
  final picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageList.add(File(pickedFile!.path));
    });
  }


  Future uploadImages() async {
    for (var i = 0; i < _imageList.length; i++) {
      Reference reference =
      storage.ref().child("images/${DateTime.now().toString()}$i.jpg");
      UploadTask uploadTask = reference.putFile(_imageList[i]);
      await uploadTask.whenComplete(() => null);
      final db = FirebaseFirestore.instance;

      db
          .collection("users")
          .doc(user?.uid.toString())
          .collection('product$j')
          .doc('Product$j value')
          .set({'imageURL$i' : _imageList[i]});

      print('${_imageList[i]}');


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Upload'),
      ),
      floatingActionButton:  FloatingActionButton(onPressed: uploadImages
          ,child:Icon(Icons.upload)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: getImage,
                child: Icon(Icons.image),
              ),
            ),
            SizedBox(height: 20),
            _imageList.isEmpty
                ? Container()
                : SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.file(_imageList[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker_view/multi_image_picker_view.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:typed_data';
//
//
// class Images extends StatefulWidget {
//   const Images({Key? key}) : super(key: key);
//
//   @override
//   State<Images> createState() => _Images();
// }
//
// class _Images extends State<Images> {
//   final controller = MultiImagePickerController(
//     maxImages: 10,
//     withReadStream: true,
//     allowedImageTypes: ['png', 'jpg', 'jpeg'],
//   );
//
//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];
//
//   void selectImages() async {
//     final List<XFile>? selectedImages = await
//     imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//     }
//     print("Image List Length:" + imageFileList!.length.toString());
//     setState((){});
//   }
//
//
//   final storageRef = FirebaseStorage.instance.ref();
//   String imgurl="";
//   late Reference referenceDirImages;
//   late Reference refernceImageToupload;
//   // User? user=FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: SafeArea(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   selectImages();
//                 },
//                 child: Text('Select Images'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GridView.builder(
//                       itemCount: imageFileList!.length,
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Image.file(File(imageFileList![index].path),
//                           fit: BoxFit.cover,);
//                       }),
//                 ),
//               ),
//             ],
//           ),
//         )
//
//     );
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
//
//
// // niche vala pehle vala code hai
// //
// // // import 'dart:html';
// //
// // import 'package:flutter/material.dart';
// // import 'package:multi_image_picker_view/multi_image_picker_view.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class Images extends StatefulWidget {
// //   const Images({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Images> createState() => _Images();
// // }
// //
// // class _Images extends State<Images> {
// //   final controller = MultiImagePickerController(
// //     maxImages: 10,
// //     withReadStream: true,
// //     allowedImageTypes: ['png', 'jpg', 'jpeg'],
// //   );
// //   // List<File> _images =[];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: (){},
// //         child: Icon(Icons.upload),
// //       ),
// //       body: SizedBox(
// //         width: double.infinity,
// //         child: Column(
// //           children: [
// //             MultiImagePickerView(
// //               controller: controller,
// //
// //               onChange: (list) {
// //                 debugPrint(list.toString());
// //                 setState(() {
// //                   // _images.add(File(controller1?.path));
// //                 });
// //               },
// //
// //               padding: const EdgeInsets.all(10),
// //
// //             ),
// //
// //             const SizedBox(height: 32),
// //             // const CustomExamples()
// //           ],
// //         ),
// //       ),
// //       appBar: AppBar(
// //         // actions: [
// //         //   IconButton(
// //         //     icon: const Icon(Icons.arrow_upward),
// //         //     onPressed: () {
// //         //       final images = controller.images;
// //         //       // use these images
// //         //       // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(images.map((e) => e.name).toString())));
// //         //     },
// //         //   ),
// //         // ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }
// // }