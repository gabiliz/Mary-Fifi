import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';

class EmptyRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
      ],
    );
  }
}
