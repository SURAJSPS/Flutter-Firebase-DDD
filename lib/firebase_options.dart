// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA5G2k_GHskwdkVqLgokaGvngv03n6FKTU',
    appId: '1:868370830004:web:88744d62611e5472047de1',
    messagingSenderId: '868370830004',
    projectId: 'flutter-firebse-ddd',
    authDomain: 'flutter-firebse-ddd.firebaseapp.com',
    storageBucket: 'flutter-firebse-ddd.appspot.com',
    measurementId: 'G-8MG81TTZWV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnPCJLNs3zLLQ0etZt2H6kzaq1yYEUy6U',
    appId: '1:868370830004:android:6f5ef11b98d2d1ee047de1',
    messagingSenderId: '868370830004',
    projectId: 'flutter-firebse-ddd',
    storageBucket: 'flutter-firebse-ddd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6yy-8IBFBrNxgRniTFK3DgRjLAw5V8WQ',
    appId: '1:868370830004:ios:f4a5df1469e12a4e047de1',
    messagingSenderId: '868370830004',
    projectId: 'flutter-firebse-ddd',
    storageBucket: 'flutter-firebse-ddd.appspot.com',
    iosClientId: '868370830004-ark2no5aajhd125jpj8rtdokj22jina7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseDddWithBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6yy-8IBFBrNxgRniTFK3DgRjLAw5V8WQ',
    appId: '1:868370830004:ios:f4a5df1469e12a4e047de1',
    messagingSenderId: '868370830004',
    projectId: 'flutter-firebse-ddd',
    storageBucket: 'flutter-firebse-ddd.appspot.com',
    iosClientId: '868370830004-ark2no5aajhd125jpj8rtdokj22jina7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseDddWithBloc',
  );
}
