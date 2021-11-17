import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/constants.dart';
import 'room.view.dart';

class CreateQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Criar pergunta',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 60.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA04FC6), width: 1),
                  borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA04FC6), width: 1),
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Text(
            'Perguntando como',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              SvgPicture.asset(logo,
                  height: 40, width: 40, fit: BoxFit.scaleDown),
              SizedBox(width: 8.0),
              Text(
                'João Gomes',
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ],
          ),
          Row(
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
                        EdgeInsets.all(15)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)))),
                child: Text(
                  "Voltar",
                  style: GoogleFonts.lato(
                    fontSize: 15.0,
                    color: Color(0xff2A2235),
                  ),
                ),
              ),
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
                        EdgeInsets.all(15)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)))),
                child: Text(
                  "Criar pergunta",
                  style: GoogleFonts.lato(
                    fontSize: 15.0,
                    color: Color(0xff2A2235),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    ));
  }
}
