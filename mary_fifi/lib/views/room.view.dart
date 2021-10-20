<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/constants.dart';
import 'package:mary_fifi/routes.dart' as route;
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mary_fifi/views/question.view.dart';
import 'package:mary_fifi/views/room_footer.view.dart';
import 'package:mary_fifi/views/room_header.view.dart';
import '../src/constants.dart';
import 'package:badges/badges.dart';

>>>>>>> b782660d2b333988c568915804951b6d5aeeffb5

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
<<<<<<< HEAD
        backgroundColor: Color(0xff2A2235),
        body: SafeArea(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        'Sala React Q&A',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '#454646',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    SvgPicture.asset(user,
                        height: 50, width: 50, fit: BoxFit.scaleDown),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Não existem perguntas, ainda...',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, route.room),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)))),
                  child: Text(
                    "Fazer Uma Pergunta",
                    style: GoogleFonts.lato(
                      fontSize: 15.0,
                      color: Color(0xff2A2235),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(height: 10),
                SvgPicture.asset(question),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(logoNome),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, route.room),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)))),
                      child: Text(
                        "Sair Da Sala",
                        style: GoogleFonts.lato(
                          fontSize: 15.0,
                          color: Color(0xff2A2235),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        )),
=======
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: [
                      RoomHeader(),
                      Question(),
                      SizedBox(height: 10.0),
                      Question(),
                      SizedBox(height: 10.0),
                      Question(),
                      SizedBox(height: 10.0),
                      RoomFooter(),
                    ],
                  ),
                ),
              )
          ),
        ),
>>>>>>> b782660d2b333988c568915804951b6d5aeeffb5
      ),
    );
  }
}
