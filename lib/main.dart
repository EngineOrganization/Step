import 'package:flutter/material.dart';
import 'package:step/screens/course.dart';
import 'package:step/screens/home.dart';
import 'package:step/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  User? user = FirebaseAuth.instance.currentUser;

  runApp(
    MaterialApp(
      home: /* user!.uid.isNotEmpty ? HomeScreen(user: user!) : LoginScreen() */ CourseScreen(user: user!, courseId: 1,)
    )
  );
}