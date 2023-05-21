import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/Admin/AddMovie/Edit_Review.dart';

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
  final bool showIcons;
  MovieReviewListView({this.showIcons = true});

  
  void deletePost(String postId) {
  FirebaseFirestore.instance
      .collection('Review')
      .doc(postId)
      .delete()
      .then((value) {
    // Post deleted successfully
    // You can show a snackbar or toast message to indicate deletion
  }).catchError((error) {
    // An error occurred while deleting the post
    // You can show an error message to the user
  });
}

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
            String? additionalDetail = reviewData?['additionalDetail'];

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
                          child: Text('Review: ${review ?? ''}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Review By: ${reviewBy ?? ''}',
                          maxLines: 6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Genre: ${genre ?? ''}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Published Date: ${publishedDate ?? ''}',
                          ),
                          
                        ),
                        //Display the additional detail
                       //Text('Additional Detail: ${additionalDetail ?? ''}'),
                       Align(
                        
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if(showIcons)
                            GestureDetector(
                              onTap: (){
                                showDialog(context: context, 
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete Review'),
                                     content: Text('Are you sure you want to delete this review?'),
                                    actions: <Widget>[
                                      TextButton(child: Text('Cancel'),
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                          },
                                       ), 
                                       TextButton(onPressed: (){
                                        deletePost(document.id);
                                       },
                                        child: Text('Delete'))

                                    ],
                                  );
                                }
                                );
                                deletePost(document.id);
                                
                              },
                               child: Icon(Ionicons.trash_bin)),
                            if (showIcons) SizedBox(width: 20),
                            if (showIcons)
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMovieReviewScreen(postId: document.id),
                              ),
                            );
                              },
                              child: Icon(Ionicons.pencil)),
                          ],
                         ),
                       )
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
