import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../sign_in.dart';
import 'create_question.view.dart';
import 'create_room.view.dart';
import 'package:provider/provider.dart';

class RoomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 2.5, 20.0, 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (context) => new CreateQuestion(),
                ),
              );
            },
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
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
              provider.logout();
              Navigator.push(
                context,
                new MaterialPageRoute(
                builder: (context) => new CreateRoom(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            100.0)))),
            child: Text(
              "Sair",
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
