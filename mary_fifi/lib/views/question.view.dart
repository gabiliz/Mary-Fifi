import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mary_fifi/views/question_room.view.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300),
      child: GestureDetector(
        onTap: () => {},
        child: Card(
          color: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                GetQuestion("question02"),
                SizedBox(height: 5.0),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(logo,
                              height: 40, width: 40, fit: BoxFit.scaleDown),
                          SizedBox(width: 8.0),
                          Text(
                            'Rachel',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 15.0),
                      Row(
                        children: <Widget>[
                          Row(children: <Widget>[
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.solidCheckCircle,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.solidComment,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.trash,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          ]),
                        ],
                      ),
                    ]),
              ],
            ),
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
          return Text("${snapshot.data!.docs.first['title']}",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 15.0));
        }
        return Text("loading");
      },
    );
  }
}
