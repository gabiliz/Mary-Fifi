import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'routes.dart' as route;
=======
import '/views/create_room.view.dart';
>>>>>>> 86553b1195a3b52091c41d229d389e4f0b51fe83
import '/views/login.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'MaryFifi - Só as fofoca quente na palma da sua mão.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
<<<<<<< HEAD
        onGenerateRoute: route.controller,
        initialRoute: route.loginPage,
=======
        home: CreateRoom(),
>>>>>>> 86553b1195a3b52091c41d229d389e4f0b51fe83
      ),
    );
  }
}
