import 'package:flutter/material.dart';
import 'package:mary_fifi/views/login.view.dart';
import 'package:mary_fifi/views/create_room.view.dart';
import 'package:mary_fifi/views/create_question.view.dart';
import 'package:mary_fifi/views/room.view.dart';

const String loginPage = 'login.view';
const String createRoom = 'create_room.view';
const String createQuestion = 'create_question.view';
const String roomPage = 'room.view';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginView());
    case createRoom:
      return MaterialPageRoute(builder: (context) => CreateRoom());
    case createQuestion:
      return MaterialPageRoute(builder: (context) => CreateQuestion());
    case roomPage:
      return MaterialPageRoute(builder: (context) => Room());
    default:
      throw ('Erro!');
  }
}
