import 'package:flutter/material.dart';
import 'login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software Tutorials',
      theme: themeData(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginScreen(),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
