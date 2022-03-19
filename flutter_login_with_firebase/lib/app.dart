import 'package:app4/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationServie>(
            create: (context) => AuthenticationServie(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationServie>().authStateChanges,
              initialData: null)
        ],
        child: MaterialApp(
          title: 'Software Tutorials',
          theme: themeData(),
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          home: AuthenticationWrapper(),
        ));
  }

  ThemeData themeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Text("Signed in");
    }
    return LoginScreen();
  }
}
