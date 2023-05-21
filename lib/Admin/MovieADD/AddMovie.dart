// // ignore_for_file: use_build_context_synchronously

// import 'dart:io';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:movielovers/Admin/MovieADD/texfield.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AddMovie extends StatefulWidget {
//   @override
//   _AddMovieState createState() => _AddMovieState();
// }

// class _AddMovieState extends State<AddMovie> {
//   final TextEditingController _NameController = TextEditingController();
//   final TextEditingController _directorController = TextEditingController();
//   final TextEditingController _actorController = TextEditingController();
//   final TextEditingController _reviewController = TextEditingController();
//   final TextEditingController _reviewbyController = TextEditingController();
//   final TextEditingController _genreController = TextEditingController();
//   final TextEditingController _publishdateController = TextEditingController();

//   File? _MovieImage;
//   String _imageUrl = '';

// // Function to add a package by the admin
//   Future<void> addreviewAdmin() async {
//     String MovieName = _NameController.text.trim();
//     String Director = _directorController.text.trim();
//     String Actor = _actorController.text.trim();
//     String Review = _reviewController.text.trim();
//     String ReviewBy = _reviewbyController.text.trim();
//     String Genre = _genreController.text.trim();
//     DateTime? PublishedDate = DateTime.now();
    
// // Validate package details
//     if (_NameController.text.isEmpty ||
//         _directorController.text.isEmpty ||
//         _actorController.text.isEmpty ||
//     _reviewController.text.isEmpty ||
//     _reviewbyController.text.isEmpty ||
//         _genreController.text.isEmpty ||
//         //_MovieImage = null ||
//         PublishedDate == null) 
//          {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content:
//                 Text('Please enter all movie details.'),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     }

// // Upload package image to Firebase Storage
//     String imageName = DateTime.now().millisecondsSinceEpoch.toString();
//     Reference storageReference =
//         FirebaseStorage.instance.ref().child('Movie_images/$imageName');
//     UploadTask uploadTask = storageReference.putFile(_MovieImage!);
//     TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
//     _imageUrl = await snapshot.ref.getDownloadURL();

// // Access the Firestore collection for packages
//     CollectionReference reviewCollection =
//         FirebaseFirestore.instance.collection('Review');

// // Create a new document with an auto-generated ID
//     try {
//       await reviewCollection.add({
//         'name': MovieName,
//         'director': Director,
//         'actor': Actor,
//         'review': Review,
//         'reviewBy': ReviewBy,
//         'publishedDate': PublishedDate,
//         'imageUrl': _imageUrl,
//         'genre': Genre,

        
        
//       });

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Success'),
//             content: Text('Review added successfully.'),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _resetFields();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to add the review. Please try again.'),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   void _resetFields() {
//     _NameController.clear();
//     _directorController.clear();
//     _actorController.clear();
//     _reviewController.clear();
//     _reviewbyController.clear();
//     _genreController.clear();
//     _publishdateController.clear();
//     _MovieImage = null;
//     _imageUrl = '';
   
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Review'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//                CustomTextFieldTile(
//             hintText: "Movie Name",
//             icon: Ionicons.person,
//             controller: _NameController,
//             keyboardType: TextInputType.text,
//             ),
            

//             CustomTextFieldTile(
//             hintText: "Director",
//             icon: Ionicons.person,
//             controller: _directorController,
//             keyboardType: TextInputType.text,
//             ),

//             CustomTextFieldTile(
//             hintText: "Actors",
//             icon: Ionicons.person,
//             controller: _actorController,
//             keyboardType: TextInputType.text,
//             ),
             
//             CustomTextFieldTile(
//             hintText: "Movie Review",
//             icon: Ionicons.person,
//             controller: _reviewController,
//             keyboardType: TextInputType.text,
//             ),

//             CustomTextFieldTile(
//             hintText: "Review By",
//             icon: Ionicons.person,
//             controller: _reviewbyController,
//             keyboardType: TextInputType.text,
//             ),
 

//             CustomTextFieldTile(
//             hintText: "Movie Genre",
//             icon: Ionicons.person,
//             controller: _genreController,
//             keyboardType: TextInputType.text,
//             ),

//             CustomTextFieldTile(
//             hintText: "Publish Date",
//             icon: Ionicons.person,
//             controller: _publishdateController,
//             keyboardType: TextInputType.number,
//             ), 
//             SizedBox(height: 10,),
//             //  RatingBar.builder(
//             //  initialRating: _rating,
//             //  minRating: 0,
//             //  maxRating: 5,
//             //  direction: Axis.horizontal,
//             //  allowHalfRating: true,
//             //  itemCount: 5,
//             //  itemSize: 30.0,
//             //  itemBuilder: (context, index) => 
//             //  Icon(Ionicons.star,
//             //  color: Colors.amber,
//             //  ),
//             //    onRatingUpdate: (rating){
//             //     print(rating);
//             //    }),
//         //     Row(
//         //       children: [
//         //         Text('Rate the Review:',
//         //         style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
//         // fontWeight: FontWeight.bold, fontSize: 21,
//         // ),
//         //         ),
//         //         SizedBox(width: 8.0,),
//         //         RatingBar.builder(
//         //            initialRating: _rating,
//         //             minRating: 0,
//         //             maxRating: 5,
//         //             direction: Axis.horizontal,
//         //             allowHalfRating: true,
//         //             itemCount: 5,
//         //             itemSize: 30.0,
//         //             itemBuilder: (context, index) => Icon(
//         //               Ionicons.star,
//         //               color: Colors.amber,
//         //             ),
//         //             onRatingUpdate: (rating) {
//         //               setState(() {
//         //                 _rating = rating;
//         //               });
//         //         )
//         //       ],
//         //     ),
        

            
              
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
// // Select and set package image
//                   final imagePicker = ImagePicker();
//                   XFile? imageFile =
//                       await imagePicker.pickImage(source: ImageSource.gallery);
//                   if (imageFile != null) {
//                     setState(() {
//                       _MovieImage = File(imageFile.path);
//                     });
//                   }
//                 },
//                 child: Text('Select Movie Poster'),
//               ),
//               SizedBox(height: 16.0),
//               _MovieImage != null
//                   ? Image.file(
//                       _MovieImage!,
//                       height: 200,
//                       width: 200,
//                       fit: BoxFit.cover,
//                     )
//                   : Container(),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: addreviewAdmin,
//                 child: Text('Post'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';

import '../AddMovie/Movie_Review.dart';

class AddMoviePage extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMoviePage> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _actorController = TextEditingController();
  final TextEditingController _reviewController =
      TextEditingController();
  final TextEditingController _reviewbyController =
      TextEditingController();
  final TextEditingController _genreController =
      TextEditingController();
  final TextEditingController _publisheddateController = TextEditingController();

  File? _packageImage;
  String _imageUrl = '';
  

  // Function to add a package by the admin
  Future<void> addreviewAdmin() async {
    String MovieName = _NameController.text.trim();
    String Director = _directorController.text.trim();
    String Actor = _actorController.text.trim();
    String Review = _reviewController.text.trim();
    String ReviewBy = _reviewbyController.text.trim();
    String Genre = _genreController.text.trim();
    DateTime  publisheddate = DateTime.now();
    // Validate package details
    if (MovieName.isEmpty ||
        Director.isEmpty ||
        Actor == null ||
        Review == null ||
        ReviewBy.isEmpty ||
        Genre == null ||
        publisheddate == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Please enter all package details, select an image, and provide a location.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

  

    // Upload package image to Firebase Storage
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('poster_images/$imageName');
    UploadTask uploadTask = storageReference.putFile(_packageImage!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    _imageUrl = await snapshot.ref.getDownloadURL();

    // Access the Firestore collection for packages
    CollectionReference packagesCollection =
        FirebaseFirestore.instance.collection('Review');

    // Create a new document with an auto-generated ID
    try {
      DocumentReference reviewRef = await packagesCollection.add({
        'name': MovieName,
        'director': Director,
        'actor': Actor,
        'review': Review,
        'reviewBy': ReviewBy,
        'genre': Genre,
        'publisheddate': publisheddate,
        'imageUrl': _imageUrl,

        
      });

      // Navigate to PackageListPage after adding a package
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Movie Review added successfully.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetFields();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieReviewListPage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add the package. Please try again.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _resetFields() {
    _NameController.clear();
    _directorController.clear();
    _actorController.clear();
    _reviewController.clear();
    _reviewbyController.clear();
    _genreController.clear();
    _publisheddateController.clear();
    _packageImage = null;
    _imageUrl = '';
  }

  void _launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to open the website.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Add Package'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _NameController,
    decoration: InputDecoration(
      labelText: 'Movie Name',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _directorController,
    decoration: InputDecoration(
      labelText: 'Director',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _actorController,
    decoration: InputDecoration(
      labelText: 'Actor',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _reviewController,
    decoration: InputDecoration(
      labelText: 'Movie Review',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _reviewbyController,
    decoration: InputDecoration(
      labelText: 'Review By',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
    maxLines: 5,
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _genreController,
    decoration: InputDecoration(
      labelText: 'Movie Genre',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
  ),
),
SizedBox(height: 16.0),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    borderRadius: BorderRadius.circular(5.0),
  ),
  child: TextFormField(
    controller: _publisheddateController,
    decoration: InputDecoration(
      labelText: 'Published Date',
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    ),
    keyboardType: TextInputType.number,
  ),
),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Select and set package image
                  final imagePicker = ImagePicker();
                  XFile? imageFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (imageFile != null) {
                    setState(() {
                      _packageImage = File(imageFile.path);
                    });
                  }
                },
                child: Text('Select Movie Poster'),
              ),
              const SizedBox(height: 16.0),
              _packageImage != null
                  ? Image.file(
                      _packageImage!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              const SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: addreviewAdmin,
              //   child: Text('Upload Movie Review'),
              // ),
              SizedBox(
  width: double.infinity,
  height: 50.0,
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Color.fromARGB(255, 241, 24, 8),
    ),
    child: ElevatedButton(
      onPressed: addreviewAdmin,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: Text(
        'Upload Movie Review',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ),
),

              SizedBox(height: 16.0),
              
            ],
          ),
        ),
      ),
    );
  }
}