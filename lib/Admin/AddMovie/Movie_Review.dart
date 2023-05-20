import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieReviewListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0,
         shadowColor: Colors.grey.withOpacity(1),
         bottom: PreferredSize(
           preferredSize: const Size.fromHeight(4),
           child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                )
              )
            ),
           ),
           ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          size: 30,
          color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () {
            Navigator.pop(context);

          }
          
           
        ),
        title: const Text('Movie Review',
        style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
        fontWeight: FontWeight.bold, fontSize: 21,
        ),
        ),
        

        
      ),
      body: MovieReviewListView(),
    );
  }
}

class MovieReviewListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Review').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No movie reviews found.'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic>? reviewData =
                document.data() as Map<String, dynamic>?;

            // Fetch the review details
            String? imageUrl = reviewData?['imageUrl'];
            String? name = reviewData?['name'];
            String? director = reviewData?['director'];
            String? actor = reviewData?['actor'];
            String? review = reviewData?['review'];
            String? reviewBy = reviewData?['reviewBy'];
            String? genre = reviewData?['genre'];
            DateTime? publishedDate =
                reviewData?['publishedDate']?.toDate();
            // Additional detail
            //String? additionalDetail = reviewData?['additionalDetail'];

            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    imageUrl ?? '',
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? '',
                          style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
        fontWeight: FontWeight.bold, fontSize: 21,
        ),
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Director: ${director ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Actor: ${actor ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Review: ${review ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Review By: ${reviewBy ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Genre: ${genre ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Published Date: ${publishedDate ?? ''}'),
                        ),
                        // Display the additional detail
                       // Text('Additional Detail: ${additionalDetail ?? ''}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
