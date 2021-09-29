import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/constants.dart';

class CreateRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff2A2235),
        body: SafeArea(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(logo),
                SizedBox(height: 80),
                SvgPicture.asset(createRoom),
                SizedBox(height: 50),
                Text(
                  'Criar uma nova sala',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Nome da sala'),
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(50, 15, 50, 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)))),
                  child: Text(
                    "Criar sala",
                    style: GoogleFonts.lato(
                      fontSize: 15.0,
                      color: Color(0xff2A2235),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    height: 20,
                    thickness: 2,
                    indent: 80,
                    endIndent: 20,
                    color: Colors.white,
                  )),
                  Text(
                    "ou",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 80,
                    color: Colors.white,
                  )),
                ]),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(50, 15, 50, 15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      )),
                  child: Text(
                    "Entrar em uma sala",
                    style: GoogleFonts.lato(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
        )),
      ),
    );
  }
}
