import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';

class RoomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            SvgPicture.asset(logo,
                height: 50, width: 50, fit: BoxFit.scaleDown),
          ],
        ),
        Row(children: <Widget>[
          Chip(
            backgroundColor: Colors.white,
            label: Text('4 perguntas',
                style: GoogleFonts.lato(color: primaryColor)),
          ),
        ]),
      ],
    );
  }
}
