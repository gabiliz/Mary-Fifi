import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/constants.dart';
import 'empty_room.view.dart';
import 'room.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mary_fifi/maryfifi_service.dart';

class QuestionRoom extends StatefulWidget {
  QuestionRoom({required this.id, required this.title, required this.personName, required this.personImageURL});

  final String id;
  final String title;
  final String personName;
  final String personImageURL;

  @override
  State<QuestionRoom> createState() => _QuestionRoomState();
}

class _QuestionRoomState extends State<QuestionRoom> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Pergunta',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('${widget.personImageURL}')),
                    SizedBox(width: 10.0),
                    Text(
                      '${widget.personName}',
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  'Respostas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.0),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: MaryFifiService.getAnswers(questionId: widget.id),
                    builder: (context, snapshot) {
                      List<AnswerTile> answerList = [];

                      print(snapshot.data!.docs.length);

                      if (snapshot.data!.docs.isEmpty) {
                        return Center(child: EmptyRoom());
                      }

                      final answers = snapshot.data!.docs;
                      for (var answer in answers) {
                        answerList.add(AnswerTile(
                          id: answer.id,
                          title: answer.data()['title'],
                          personName: answer.data()['person_name'],
                          personImageURL: answer.data()['person_photoURL'],
                        ));
                      }

                      return Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: answerList,
                        ),
                      );
                    }
                ),
                SizedBox(height: 25.0),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Room(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.fromLTRB(25, 15, 25, 15)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0)))),
                        child: Text(
                          "Voltar",
                          style: GoogleFonts.lato(
                            fontSize: 15.0,
                            color: Color(0xff2A2235),
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0),
                      TextButton(
                        onPressed: () {
                          MaryFifiService.addQuestion(
                              title: title,
                              personName: user?.displayName,
                              personImageURL: user?.photoURL);
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new Room(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(100.0)))),
                        child: Text(
                          "Responder",
                          style: GoogleFonts.lato(
                            fontSize: 15.0,
                            color: Color(0xff2A2235),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.id,
    required this.title,
    required this.personName,
    required this.personImageURL,
  }) : super(key: key);

  final String id;
  final String title;
  final String personName;
  final String personImageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                Text(
                  title,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(personImageURL)),
                        SizedBox(width: 8.0),
                        Text(
                          personName,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 15.0),
                    Row(
                      children: <Widget>[
                        Row(children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.trash,
                                color: Colors.white),
                            onPressed: () {
                              MaryFifiService.deleteAnswer(id: id);
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
