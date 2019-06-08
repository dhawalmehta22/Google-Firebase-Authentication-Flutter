import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/Login/index.dart';
import 'screens/SignUp/index.dart';
import 'screens/Home/index.dart';
import 'theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Flat App",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}

Widget _handleCurrentScreen() {
  
  return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // TODO create SplashScreen()
          return Scaffold(
              body: Center(
            child: Container(
              child: Text('Loading...'),
            ),
          ));
        } else {
          if (snapshot.hasData) {
            return Scaffold();
          }
         
          return LoginScreen();
        }
      });
}