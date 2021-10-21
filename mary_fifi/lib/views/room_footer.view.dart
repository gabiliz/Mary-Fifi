import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/routes.dart' as route;

class RoomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 2.5, 20.0, 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, route.loginPage),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            100.0)))),
            child: Text(
              "Fazer uma pergunta",
              style: GoogleFonts.lato(
                fontSize: 15.0,
                color: Color(0xff2A2235),
              ),
            ),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, route.loginPage),
            style: ButtonStyle(
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
      ),
    );
  }
}
