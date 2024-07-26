// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyByhECLlxtV2Pzo6i63TFxDKwYFOtnMdDY',
    appId: '1:384697882616:web:3a349c12326f69d939e80d',
    messagingSenderId: '384697882616',
    projectId: 'todo-app-case',
    authDomain: 'todo-app-case.firebaseapp.com',
    storageBucket: 'todo-app-case.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz_a-O6Iyc1bQt2wKsNctl1IB1avKQu6o',
    appId: '1:384697882616:android:4874284709c58e8639e80d',
    messagingSenderId: '384697882616',
    projectId: 'todo-app-case',
    storageBucket: 'todo-app-case.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeZ39SFCOE6HDZtnR8uTK9rh5F7VABu2c',
    appId: '1:384697882616:ios:c24062a107e4b15139e80d',
    messagingSenderId: '384697882616',
    projectId: 'todo-app-case',
    storageBucket: 'todo-app-case.appspot.com',
    iosBundleId: 'com.example.todoAppCase',
  );
}
