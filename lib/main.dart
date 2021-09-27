import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pinterest_clone/log_in/login_screen.dart';

import 'home_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('Welcome to Pinterest Clone App '),

                  ),
                ),
              ),
            );
          }else if(snapshot.hasError){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Text('An error Occured Please wait...'),

                  ),
                ),
              ),
            );

          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Pinterest Clone',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFF004D40),
              primarySwatch: Colors.teal,
            ),
            home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : HomeScreen(),
          );

        },
    );
  }
}
