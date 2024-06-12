import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdp_quiz_app/app.dart';
import 'package:pdp_quiz_app/firebase_options.dart';

void main(List<String> args) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
