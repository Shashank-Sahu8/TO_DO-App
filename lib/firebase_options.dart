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
    apiKey: 'AIzaSyBbonmLSYy6_vw2WQtA4fMEqld4lLcqvHk',
    appId: '1:1091930685613:web:87b69a7540c959d70c4624',
    messagingSenderId: '1091930685613',
    projectId: 'todoshashank',
    authDomain: 'todoshashank.firebaseapp.com',
    storageBucket: 'todoshashank.appspot.com',
    measurementId: 'G-4GWDXSQRD5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgruD4YCJb10l_NvMbAhRKgz_92PvcUkM',
    appId: '1:1091930685613:android:df6b95ce758f54770c4624',
    messagingSenderId: '1091930685613',
    projectId: 'todoshashank',
    storageBucket: 'todoshashank.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIL30DISZOEY6rjR1Sqb5IC8LSRM_dhK8',
    appId: '1:1091930685613:ios:c08caed6b4ac8d2c0c4624',
    messagingSenderId: '1091930685613',
    projectId: 'todoshashank',
    storageBucket: 'todoshashank.appspot.com',
    iosBundleId: 'com.example.toDo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIL30DISZOEY6rjR1Sqb5IC8LSRM_dhK8',
    appId: '1:1091930685613:ios:d6021af243a91c990c4624',
    messagingSenderId: '1091930685613',
    projectId: 'todoshashank',
    storageBucket: 'todoshashank.appspot.com',
    iosBundleId: 'com.example.toDo.RunnerTests',
  );
}
