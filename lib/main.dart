import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ddd_with_bloc/app_widget.dart';
import 'package:flutter_firebase_ddd_with_bloc/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const AppWidget(),
  );
}
