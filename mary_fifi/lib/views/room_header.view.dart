import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';

class RoomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Text(
                  'Sala Pública',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0),
                Chip(
                  backgroundColor: Colors.white,
                  label: Text('Sala de perguntas',
                      style: GoogleFonts.lato(color: primaryColor)),
                ),
              ]),
              CircleAvatar(radius: 25, backgroundImage: NetworkImage('${user?.photoURL}')),
            ],
          ),
        ],
      ),
    );
  }
}
