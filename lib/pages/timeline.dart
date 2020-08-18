import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/pages/home.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
//    createUser();
//    updateUser();
    deleteUser();
    super.initState();
  }

//  getUsers(){
//    usersRef.getDocuments().then((QuerySnapshot snapshot) {
//      snapshot.documents.forEach((DocumentSnapshot doc) {
//        print(doc.data);
//        print(doc.documentID);
//        print(doc.exists);
//      });
//    });
//  }
//  getUserById() async{
//    final String id = 'nZpxRaRctprG5PJePJNx';
//    final DocumentSnapshot doc =  await usersRef.document(id).get();
//      print(doc.data);
//      print(doc.documentID);
//      print(doc.exists);
//
//  }
//  getUsers() async {
//    final QuerySnapshot snapshot = await usersRef.getDocuments();
////        .where("isAdmin", isEqualTo: false)
////        .where("username", isEqualTo: 'Arlou')
////        .orderBy("postCount", descending: false)
////        .getDocuments();
////    snapshot.documents.forEach((DocumentSnapshot doc) {
////      print(doc.data);
////      print(doc.documentID);
////      print(doc.exists);
////    });
//    setState(() {
//      users = snapshot.documents;
//    });
//  }

  createUser() {
    usersRef.document('12asdasdas').setData(
      {'username': 'Jeff', 'postcount': 0, 'isAdmin': false},
    );
  }

  updateUser() async {
    final doc = await usersRef.document("9RGYJijv1eQHDLSFMnkn").get();
//        .updateData({'username': 'John', 'postcount': 0, 'isAdmin': false});
    if (doc.exists) {
      doc.reference
          .updateData({'username': 'John', 'postcount': 0, 'isAdmin': false});
    }
  }

  deleteUser() async {
    final DocumentSnapshot doc =
        await usersRef.document("9RGYJijv1eQHDLSFMnkn").get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true, titleText: 'Timeline'),
//      body: Container(
////          child: ListView( children: users.map((user) => Text(user['username'])).toList(),
////      )),
        body: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapshot.data.documents
                .map((doc) => Text(doc['username']))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          },
        ));
  }
}
