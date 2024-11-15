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
    apiKey: 'AIzaSyDDbqFD8N30SAisiDEmhWZKYe8_E_NTPQo',
    appId: '1:358822140566:web:f3bfe2e6f3043c1939c0b7',
    messagingSenderId: '358822140566',
    projectId: 'aldens-proj',
    authDomain: 'aldens-proj.firebaseapp.com',
    storageBucket: 'aldens-proj.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpMznjszNHn05YKsUInEVhMUdaHEzRt-M',
    appId: '1:358822140566:android:06e74a2a7d22967839c0b7',
    messagingSenderId: '358822140566',
    projectId: 'aldens-proj',
    storageBucket: 'aldens-proj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPeEkvfUIR-bLGPQgkHDroKny3TwOYAnE',
    appId: '1:358822140566:ios:7ba9d54d76ee30ef39c0b7',
    messagingSenderId: '358822140566',
    projectId: 'aldens-proj',
    storageBucket: 'aldens-proj.appspot.com',
    iosBundleId: 'com.example.app',
  );
}
