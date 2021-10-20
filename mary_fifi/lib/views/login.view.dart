import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/constants.dart';
import 'package:mary_fifi/routes.dart' as route;

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff2A2235),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SvgPicture.asset(logo),
              SizedBox(height: 80),
              SvgPicture.asset(welcome),
              SizedBox(height: 50),
              Text(
                'Toda pergunta tem uma resposta',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: Text(
                  'Ajude e espalhe conhecimento com outras pessoas.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, route.createRoom),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)))),
                child: Text(
                  "Vamos começar",
                  style: GoogleFonts.lato(
                    fontSize: 15.0,
                    color: Color(0xff2A2235),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
