import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/constants.dart';
import 'room.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mary_fifi/maryfifi_service.dart';

class CreateAnswer extends StatefulWidget {
  @override
  State<CreateAnswer> createState() => _CreateAnswerState();
}

class _CreateAnswerState extends State<CreateAnswer> {
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
                  'Responder pergunta',
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
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffA04FC6), width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffA04FC6), width: 1),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  maxLines: 6,
                  onChanged: (value) {
                    title = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Respondendo como',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
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
                    ),
                    SizedBox(width: 25.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new CreateAnswer(),
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
                          "Criar resposta",
                          style: GoogleFonts.lato(
                            fontSize: 15.0,
                            color: Color(0xff2A2235),
                          ),
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
    ));
  }
}
