//import 'dart:io';

import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
//import 'package:firebase_core/firebase_core.dart';
void main () async {
  //WidgetsFlutterBinding.ensureInitialized();
try {
  // Platform.isAndroid ?
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyA8v_7Ju2eVArb9dqHCVj-Df9acBoSeA2M",
  //       appId: "1:859746207765:android:f775b41537045fcf5fe61c",
  //       messagingSenderId: "859746207765",
  //       projectId: "my-project-6b178"
  //       ),
  //   ) :
  //   await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print('Firebase Initialization Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}













