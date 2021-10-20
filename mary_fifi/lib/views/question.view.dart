import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mary_fifi/src/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300),
      child: GestureDetector(
        onTap: () => {},
        child: Card(
          color: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Olá, eu gostaria de saber como criar um componente funcional dentro do React e se existe diferença na forma de criar os componentes.',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 15.0),
                ),
                SizedBox(height: 5.0),
                Row(children: <Widget>[
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    label: Text('React',
                        style: GoogleFonts.lato(color: primaryColor, fontSize: 12.0)),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white,
                    label: Text('Javascript',
                        style: GoogleFonts.lato(color: primaryColor, fontSize: 12.0)),
                  ),
                ]),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SvgPicture.asset(logo,
                              height: 40, width: 40, fit: BoxFit.scaleDown),
                          SizedBox(width: 8.0),
                          Text(
                            'Rachel',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 15.0),
                      Row(
                        children: <Widget>[
                          Row(children: <Widget>[
                            IconButton(
                                icon: FaIcon(
                                    FontAwesomeIcons.solidCheckCircle,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.solidComment,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                            IconButton(
                                icon: FaIcon(FontAwesomeIcons.trash,
                                    color: Colors.white),
                                onPressed: () {
                                  print("Pressed");
                                }),
                          ]),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
