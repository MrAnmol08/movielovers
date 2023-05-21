// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditMovieReviewScreen extends StatefulWidget {
  final String postId;

  EditMovieReviewScreen({required this.postId});

  @override
  _EditMovieReviewScreenState createState() => _EditMovieReviewScreenState();
}

class _EditMovieReviewScreenState extends State<EditMovieReviewScreen> {
  String? name;
  String? director;
  String? actor;
  String? review;
  String? reviewBy;
  String? genre;
  DateTime? publishedDate;

  @override
  void initState() {
    super.initState();
    // Retrieve the existing review data from Firestore
    FirebaseFirestore.instance
        .collection('Review')
        .doc(widget.postId)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? reviewData =
            documentSnapshot.data() as Map<String, dynamic>?;

        // Set the variables with existing data
        setState(() {
          name = reviewData?['name'];
          director = reviewData?['director'];
          actor = reviewData?['actor'];
          review = reviewData?['review'];
          reviewBy = reviewData?['reviewBy'];
          genre = reviewData?['genre'];
          publishedDate = reviewData?['publishedDate']?.toDate();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Movie Review'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Director:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: director,
              onChanged: (value) {
                setState(() {
                  director = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Repeat the above pattern for other fields (actor, review, reviewBy, genre, publishedDate)
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the review data in Firestore
                FirebaseFirestore.instance
                    .collection('Review')
                    .doc(widget.postId)
                    .update({
                  'name': name,
                  'director': director,
                  'actor': actor,
                  'review': review,
                  'reviewBy': reviewBy,
                  'genre': genre,
                  'publishedDate': publishedDate,
                }).then((value) {
                  // Review updated successfully
                  Navigator.pop(context); // Return to the previous screen
                }).catchError((error) {
                  // An error occurred while updating the review
                  // You can show an error message to the user
                });
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
