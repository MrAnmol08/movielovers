import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});

  //refrence for our collections
  final CollectionReference userCollection = 
  FirebaseFirestore.instance.collection("Users");

  final CollectionReference groupCollection = 
  FirebaseFirestore.instance.collection("groups");

  //updating the userdata
  Future updateUserData(String fullName, String email )async {
    return await userCollection.doc(uid).set({
      "fullname" : fullName,
      "email": email,
      "groups":[],
      "uid": uid,
    });

  }
}