import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mary_fifi/views/question.view.dart';
import 'package:mary_fifi/views/room_footer.view.dart';
import 'package:mary_fifi/views/room_header.view.dart';
import '../src/constants.dart';

class Room extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  RoomHeader(),
                  Question(),
                  Question(),
                  Question(),
                  SizedBox(height: 10.0),
                  RoomFooter(),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
