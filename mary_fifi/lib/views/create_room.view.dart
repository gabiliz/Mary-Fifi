import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mary_fifi/sign_in.dart';
import 'package:mary_fifi/views/room.view.dart';
import '../src/constants.dart';
import 'package:provider/provider.dart';

class CreateRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(logo),
                    SizedBox(height: 80),
                    SvgPicture.asset(createRoom,
                        height: 180, width: 180, fit: BoxFit.scaleDown),
                    SizedBox(height: 50),
                    Text(
                      'Entre com a \n sua conta do Google',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          'Acesse sua conta na tela seguinte. Não se preocupe, suas informações estão seguras conosco.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
                        "Entrar com o Google",
                        style: GoogleFonts.lato(
                          fontSize: 15.0,
                          color: Color(0xff2A2235),
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
