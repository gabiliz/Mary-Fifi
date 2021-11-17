import 'package:flutter/material.dart';
import 'package:mary_fifi/sign_in.dart';
import 'package:provider/provider.dart';
import 'routes.dart' as route;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    // return Container(
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
