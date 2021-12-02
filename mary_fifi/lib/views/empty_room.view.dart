import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';
import 'create_question.view.dart';

class EmptyRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(createRoom, height: 200, width: 200),
        SizedBox(height: 20),
        Text(
          'Não existem perguntas no momento',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 250,
          child: Text(
            'Crie perguntas no botão abaixo.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
