import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/constants.dart';
import 'package:mary_fifi/routes.dart' as route;

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Sala React Q&A',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text('#454646',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                      ),
                      SvgPicture.asset(
                        logo,
                        height: 50, width: 50,
                        fit: BoxFit.scaleDown
                      ),
                    ],
                  ),
                  SizedBox(height: 650.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                          title,
                          height: 50, width: 50,
                          fit: BoxFit.scaleDown
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, route.loginPage),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.fromLTRB(50, 15, 50, 15)),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)))),
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
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
