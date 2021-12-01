import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/constants.dart';
import 'room.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mary_fifi/maryfifi_service.dart';

class QuestionRoom extends StatefulWidget {
  @override
  State<QuestionRoom> createState() => _QuestionRoomState();
}

class _QuestionRoomState extends State<QuestionRoom> {
  late String title;

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
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Pergunta',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'pergunta bla bla bla bla bla bla bla',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage('${user?.photoURL}')),
                      SizedBox(width: 10.0),
                      Text(
                        '${user?.displayName}',
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Respostas',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
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
                              'resposta bla bla bla bla bla',
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              '${user?.photoURL}')),
                                      SizedBox(width: 8.0),
                                      Text(
                                        '${user?.displayName}',
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
                                              print("Pressed");
                                              // MaryFifiService.deleteQuestion(
                                              //     id: id);
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
