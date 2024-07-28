import 'package:flutter/material.dart';
import 'package:step/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
    MaterialApp(
      home: LoginScreen(),
    )
  );
}