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
    apiKey: 'AIzaSyB-AIU6qz1ZoZlCrMmKsLfHrTOe8qxXzDE',
    appId: '1:986844355796:web:7cd580e69249eabf13ef41',
    messagingSenderId: '986844355796',
    projectId: 'orphanagrmanagement',
    authDomain: 'orphanagrmanagement.firebaseapp.com',
    storageBucket: 'orphanagrmanagement.appspot.com',
    measurementId: 'G-PREKQ93G3T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAP1LpH3hlUJKhEt6CI5vgMjRMQ6yMYfw',
    appId: '1:986844355796:android:c3841933036db73513ef41',
    messagingSenderId: '986844355796',
    projectId: 'orphanagrmanagement',
    storageBucket: 'orphanagrmanagement.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbFFCpQ7StRC1ZPLMSwBLT0uXvJdUXDCk',
    appId: '1:986844355796:ios:4f7b5a0bedf69e3513ef41',
    messagingSenderId: '986844355796',
    projectId: 'orphanagrmanagement',
    storageBucket: 'orphanagrmanagement.appspot.com',
    iosBundleId: 'com.example.orphanagemanagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbFFCpQ7StRC1ZPLMSwBLT0uXvJdUXDCk',
    appId: '1:986844355796:ios:5e1ef9740250acb113ef41',
    messagingSenderId: '986844355796',
    projectId: 'orphanagrmanagement',
    storageBucket: 'orphanagrmanagement.appspot.com',
    iosBundleId: 'com.example.orphanagemanagement.RunnerTests',
  );
}
