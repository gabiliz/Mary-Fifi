import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/constants.dart';

class CreateQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
        ],
      )),
    ));
  }
}
