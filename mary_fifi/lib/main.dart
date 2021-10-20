import 'package:flutter/material.dart';
import 'routes.dart' as route;
// ignore: unused_import
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
        onGenerateRoute: route.controller,
        initialRoute: route.loginPage,
      ),
    );
  }
}
