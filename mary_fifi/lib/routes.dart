import 'package:flutter/material.dart';

import 'package:mary_fifi/views/login.view.dart';

const String loginPage = 'login.view';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginView());
    default:
      throw ('Erro!');
  }
}
