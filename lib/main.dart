import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testeStorage/app/page/sign_in/sign_In.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PT_Sans-Narrow-Web',
        backgroundColor: Colors.grey[600],
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            size: 2
          ),
          textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'PT_Sans-Narrow-Web')),
          color: Colors.grey[800]
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
    );
  }
}
