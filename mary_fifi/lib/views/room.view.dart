import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mary_fifi/views/question.view.dart';
import 'package:mary_fifi/views/room_footer.view.dart';
import 'package:mary_fifi/views/room_header.view.dart';
import '../src/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        bottomSheet: RoomFooter(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: [
                      RoomHeader(),
                      Question(),
                      GetQuestion('question01'),
                      GetQuestion('question02'),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}

class GetQuestion extends StatelessWidget {
  final String documentId;

  GetQuestion(this.documentId);

  @override
  Widget build(BuildContext context) {
    final questions = FirebaseFirestore.instance
        .collection('questions')
        .where('id', isEqualTo: documentId)
        .snapshots();

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: questions,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (!snapshot.hasData) {
          return Text("Document does not exist");
        }

        if (snapshot.hasData) {
          return Text(
              "Full Name: ${snapshot.data!.docs.first['title']} ${snapshot.data!.docs.first['description']}");
        }

        return Text("loading");
      },
    );
  }
}