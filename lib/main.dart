import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_ddd_with_bloc/presentation/core/app_widget.dart';
import 'package:flutter_firebase_ddd_with_bloc/injection.dart';
import 'package:injectable/injectable.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppWidget());
}
