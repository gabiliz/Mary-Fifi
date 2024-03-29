import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/views/empty_room.view.dart';
import 'package:mary_fifi/views/question.view.dart';
import 'package:mary_fifi/views/question_room.view.dart';
import 'package:mary_fifi/views/room_footer.view.dart';
import 'package:mary_fifi/views/room_header.view.dart';
import '../maryfifi_service.dart';
import '../src/constants.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        bottomSheet: RoomFooter(),
        body: SafeArea(
          child: Column(
            children: [
              RoomHeader(),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: MaryFifiService.getQuestions(),
                builder: (context, snapshot) {
                  List<QuestionTile> questionList = [];

                  if (snapshot.data!.docs.isEmpty) {
                    return EmptyRoom();
                  }

                  final questions = snapshot.data!.docs;
                  for (var question in questions) {
                    questionList.add(QuestionTile(
                      id: question.id,
                      title: question.data()['title'],
                      personName: question.data()['person_name'],
                      personImageURL: question.data()['person_imageURL'],
                    ));
                  }

                  return Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: questionList,
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
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
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
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
                            overflow: TextOverflow.ellipsis,
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
                                icon: FaIcon(FontAwesomeIcons.solidComment,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                      builder: (context) => new QuestionRoom(id: id, title: title, personName: personName, personImageURL: personImageURL),
                                    ),
                                  );
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.trash,
                                    color: Colors.white),
                                onPressed: () {
                                  MaryFifiService.deleteQuestion(id: id);
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
