// // ignore_for_file: non_constant_identifier_names, library_prefixes

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:movielovers/Admin/MovieADD/texfield.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image/image.dart' as Im;
// import 'package:uuid/uuid.dart';
// // import 'package:firebase_app_check/firebase_app_check.dart';

// final Reference storageRef = FirebaseStorage.instance.ref();
// final CollectionReference postsRef =
//     FirebaseFirestore.instance.collection("Movie Review");
// final user = FirebaseAuth.instance.currentUser!;

// class AddMovie extends StatefulWidget {
//   const AddMovie({Key? key}) : super(key: key);

//   @override
//   State<AddMovie> createState() => _AddMovieState();
// }

// class _AddMovieState extends State<AddMovie> {
  
//   TextEditingController nameController = TextEditingController();
//   TextEditingController directorController = TextEditingController();
//   TextEditingController actorController = TextEditingController();
//   TextEditingController reviewController = TextEditingController();
//   TextEditingController reviewbyController = TextEditingController();
//   TextEditingController genreController = TextEditingController();
//   TextEditingController publisheddateController = TextEditingController();
//   bool isUploading = false;
//   String reviewId = const Uuid().v4();
//   File? image;

//   @override
//   void dispose(){
//     nameController.dispose();
//     directorController.dispose();
//     actorController.dispose();
//     reviewController.dispose();
//     reviewbyController.dispose();
//     genreController.dispose();
//     publisheddateController.dispose();
//     super.dispose();
//   }


//   void handleChooseFromGallery() async {
//     Navigator.pop(context);
//     var photo = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );

//     setState(() {
//       image = File(photo!.path);
//     });
//   }
// //Dialog box will apper to choode image from gallery option and cancel after clicking on upload
//    selectImage(parentContext) {
//     return showDialog(
//       context: parentContext,
//       builder: (context) {
//         return SimpleDialog(
//           title: const Text('Create Post'),
//           children: <Widget>[
//             SimpleDialogOption(
//               onPressed: handleChooseFromGallery,
//               child: const Text('Image from Gallery'),
//             ),
//             SimpleDialogOption(
//               child: const Text('Cancel'),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Container buildSplashScreen() {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/Add_Movie_Review_SplashScreen.jpg'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () => selectImage(context),
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(const Color.fromARGB(255, 241, 24, 8)),
//                   fixedSize: MaterialStateProperty.all<Size>(
//                     const Size(220, 50),
//                   ),
//                 ),
//                 child: const Text(
//                   'Upload',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   clearImage() {
//     setState(() {
//       image = null;
//     });
//   }

//   compressImage() async {
//     final tempDir = await getTemporaryDirectory();
//     final path = tempDir.path;
//     Im.Image? imageFile = Im.decodeImage(image!.readAsBytesSync());
//     final compressedImageFile = File('$path/img_$reviewId.jpg')
//       ..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 85));
//     setState(() {
//       image = compressedImageFile;
//     });
//   }

//   Future<String> uploadImage(imageFile) async {
//     UploadTask uploadTask = storageRef.child("post_$reviewId.jpg").putFile(
//         imageFile); //database.dart file import garnu parxa aani error hatxa so import gar
//     TaskSnapshot storageSnap = await uploadTask;
//     String downloadUrl = await storageSnap.ref.getDownloadURL();
//     return downloadUrl;
//   }

//   Future createPostInFirestore({
//     required String mediaUrl,
//      String? Movie_Name,
//     String? Movie_Director,
//      String? Movie_Actor,
//      String? Movie_Review,
//      String? Review_By,
//      String? Genre,
//     DateTime? Published_Date,

//   }) async {
//     final User currentUser = FirebaseAuth.instance.currentUser!;
//     final CollectionReference postsRef = FirebaseFirestore.instance
//         .collection('Admin');
//         return postsRef
//         .doc(currentUser.uid)
//         .collection('Movie Review').doc().set({
//       'mediaUrl': mediaUrl,
//       'Movie Name': nameController.text,
//       'Director': directorController.text,
//       'Actors': actorController.text,
//       'Review': reviewController.text,
//       'Review By': reviewController.text,
//       'Genre': genreController.text,
//       'Published Date': DateTime.now(),
//     });
//   }


//   handleSubmit() async {
//     setState(() {
//       isUploading = true;
//     });
//     await compressImage();
//     String mediaUrl = await uploadImage(image);
//     await createPostInFirestore(
//       mediaUrl: mediaUrl,
//       Movie_Name: nameController.text,
//      // Movie_Director: directorController.text,
//       //Movie_Actor: actorController.text,
//       Movie_Review: reviewController.text,
//       Review_By: reviewbyController.text,
//       //Genre: genreController.text,
//       //Published_Date: DateTime.now(),
//     );

//     nameController.clear();
//     directorController.clear();
//     actorController.clear();
//     reviewController.clear();
//     reviewbyController.clear();
//     genreController.clear();
//     publisheddateController.clear();
//     setState(() {
//       image = null;
//       isUploading = false;
//       reviewId = const Uuid().v4();
//     });
//   }


//   Scaffold buildUploadForm(){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color.fromARGB(255, 54, 63, 96),
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Upload Movie',
//           style: TextStyle(
//             color: Color.fromARGB(255, 54, 63, 96),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
       
        
//       ),
//       body: ListView(
//         children: <Widget>[
//           isUploading ? const LinearProgressIndicator() : const Text(""),
//           SizedBox(
//             height: 210.0,
//             width: MediaQuery.of(context).size.width * 0.8,
//             child: Center(
//               child: AspectRatio(
//                 aspectRatio: 15 / 8,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: FileImage(image!),
//                   )),
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 8.0),
//           ),
//            const CustomTextFieldTile(
//             hintText: "Movie Name",
//             icon: Ionicons.person,
            
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Director",
//             icon: Ionicons.person,
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Actors",
//             icon: Ionicons.people,
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Review",
//             icon: Ionicons.reader,
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Review By",
//             icon: Ionicons.person,
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Genre",
//             icon: Ionicons.image,
//           ),
//           const SizedBox(height: 5),
//           const CustomTextFieldTile(
//             hintText: "Published Date",
//             icon: Ionicons.time,
//           ),
//            const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: GestureDetector(
//                       onTap:
//                       isUploading ? null : handleSubmit,
                      
//                       child: Container(
//                         padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 241, 24, 8),
//                             borderRadius: BorderRadius.circular(12)),
//                         child: const Center(
//                           child: Text('Post',
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 247, 247, 247),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 5),
//         ],
//       ),
//     );
//   }
  

//  @override
//   Widget build(BuildContext context) {
//     return image == null ? buildSplashScreen() : buildUploadForm();
//   }
// }

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/Admin/MovieADD/texfield.dart';
import 'package:url_launcher/url_launcher.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _actorController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _reviewbyController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _publishdateController = TextEditingController();

  File? _MovieImage;
  String _imageUrl = '';

// Function to add a package by the admin
  Future<void> addPackageByAdmin() async {
    String MovieName = _NameController.text.trim();
    String Director = _directorController.text.trim();
    String Actor = _actorController.text.trim();
    String Review = _reviewController.text.trim();
    String ReviewBy = _reviewbyController.text.trim();
    String Genre = _genreController.text.trim();
    DateTime? PublishedDate = DateTime.now();
    
// Validate package details
    if (MovieName.isEmpty ||
        Director.isEmpty ||
        Actor == null ||
        Review == null ||
        ReviewBy == null ||
        Genre == null ||
        PublishedDate == null) 
         {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('Please enter all movie details and select an image.'),
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
        FirebaseStorage.instance.ref().child('package_images/$imageName');
    UploadTask uploadTask = storageReference.putFile(_MovieImage!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    _imageUrl = await snapshot.ref.getDownloadURL();

// Access the Firestore collection for packages
    CollectionReference packagesCollection =
        FirebaseFirestore.instance.collection('Review');

// Create a new document with an auto-generated ID
    try {
      await packagesCollection.add({
        'name': MovieName,
        'director': Director,
        'actor': Actor,
        'review': Review,
        'reviewBy': ReviewBy,
        'publishedDate': PublishedDate,
        'imageUrl': _imageUrl,
        'genre': Genre,
        
        
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Review added successfully.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetFields();
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
            content: Text('Failed to add the review. Please try again.'),
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
    _publishdateController.clear();
    _MovieImage = null;
    _imageUrl = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
            //    CustomTextFieldTile(
            // hintText: "Movie Name",
            // icon: Ionicons.person,
            
            // )
              TextFormField(
                controller: _NameController,
                decoration: InputDecoration(
                  labelText: 'Movie Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _directorController,
                decoration: InputDecoration(
                  labelText: 'Director',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _actorController,
                decoration: InputDecoration(
                  labelText: 'Actors',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _reviewController,
                decoration: InputDecoration(
                  labelText: 'Movie Review',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _reviewbyController,
                decoration: InputDecoration(
                  labelText: 'Review By',
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(
                  labelText: "Movie Genre",
                ),
              ),
               SizedBox(height: 16.0),
              TextFormField(
                controller: _publishdateController,
                decoration: InputDecoration(
                  labelText: "Publish Date",
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
                      _MovieImage = File(imageFile.path);
                    });
                  }
                },
                child: Text('Select Movie Poster'),
              ),
              SizedBox(height: 16.0),
              _MovieImage != null
                  ? Image.file(
                      _MovieImage!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: addPackageByAdmin,
                child: Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}