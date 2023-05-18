import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as Im;

final Reference storageRef = FirebaseStorage.instance.ref();
final CollectionReference postsRef =
    FirebaseFirestore.instance.collection("Movie Review");
final user = FirebaseAuth.instance.currentUser!;

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController actorController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  TextEditingController reviewbyController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController publisheddateController = TextEditingController();
  bool isUploading = false;
   String reviewId = Uuid().v4();
  File? image;


  void handleChooseFromGallery() async {
    Navigator.pop(context);
    var photo = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      image = File(photo!.path);
    });
  }
//Dialog box will apper to choode image from gallery option and cancel after clicking on upload
  void selectImage(parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text('Create Post'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Image from Gallery'),
              onPressed: handleChooseFromGallery,
            ),
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  Container buildSplashScreen() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Add_Movie_Review_SplashScreen.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => selectImage(context),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color.fromARGB(255, 241, 24, 8)),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(220, 50),
                  ),
                ),
                child: const Text(
                  'Upload',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  clearImage() {
    setState(() {
      image = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? imageFile = Im.decodeImage(image!.readAsBytesSync());
    final compressedImageFile = File('$path/img_$reviewId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 85));
    setState(() {
      image = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    UploadTask uploadTask = storageRef.child("post_$reviewId.jpg").putFile(
        imageFile); //database.dart file import garnu parxa aani error hatxa so import gar
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({
    required String mediaUrl,
    String? Movie_Name,
    String? Movie_Director,
    String? Movie_Actor,
    String? Movie_Review,
    String? Review_By,
    String? Genre,
    DateTime? Published_Date,

  }) async {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    final CollectionReference postsRef = FirebaseFirestore.instance
        .collection('Admin')
        .doc(currentUser.uid)
        .collection('Movie Review');

    await postsRef.add({
      'mediaUrl': mediaUrl,
      'Movie Name': Movie_Name ?? '',
      'Director': Movie_Director ?? '',
      'Actors': Movie_Actor ?? '',
      'Review': Movie_Review ?? '',
      'Review By': Review_By ?? '',
      'Genre': Genre ?? '',
      'Published Date': Published_Date ?? ''
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(image);
    await createPostInFirestore(
      mediaUrl: mediaUrl,
      Movie_Name: nameController.text,
      Movie_Director: directorController.text,
      Movie_Actor: actorController.text,
      Movie_Review: reviewController.text,
      Review_By: reviewbyController.text,
      Genre: genreController.text,
      Published_Date: DateTime.now(),
    );

    nameController.clear();
    directorController.clear();
    actorController.clear();
    reviewController.clear();
    reviewbyController.clear();
    genreController.clear();
    publisheddateController.clear();
    setState(() {
      image = null;
      isUploading = false;
      reviewId = Uuid().v4();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Upload Movie',
          style: TextStyle(
            color: Color.fromARGB(255, 54, 63, 96),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: buildSplashScreen(),
    );
  }
}


