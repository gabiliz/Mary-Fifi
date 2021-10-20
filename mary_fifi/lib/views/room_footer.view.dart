import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';
import 'package:mary_fifi/routes.dart' as route;

class RoomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset(
            title,
            height: 50, width: 50,
            fit: BoxFit.scaleDown
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, route.loginPage),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.fromLTRB(50, 15, 50, 15)),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          100.0)))),
          child: Text(
            "Sair da sala",
            style: GoogleFonts.lato(
              fontSize: 15.0,
              color: Color(0xff2A2235),
            ),
          ),
        ),
      ],
    );
  }
}
