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
    apiKey: 'AIzaSyAfnuTsrOezGu9AU0GreElHquayUDpTF-c',
    appId: '1:480880931433:web:99fa1c0e84fffd3128a8f8',
    messagingSenderId: '480880931433',
    projectId: 'be-energised',
    authDomain: 'be-energised.firebaseapp.com',
    storageBucket: 'be-energised.appspot.com',
    measurementId: 'G-Y64KKPWDMR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPwEwz8ZmAXq_2e0f6W-b_oYH_tx0-9OY',
    appId: '1:480880931433:android:dc234a68a9e3355728a8f8',
    messagingSenderId: '480880931433',
    projectId: 'be-energised',
    storageBucket: 'be-energised.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYxrM0UdOCUnpjS1pCHYl6Z88rwC4kb0c',
    appId: '1:480880931433:ios:1db8126c46b26a2228a8f8',
    messagingSenderId: '480880931433',
    projectId: 'be-energised',
    storageBucket: 'be-energised.appspot.com',
    iosClientId: '480880931433-apqfhqdd1a52jhhl6fge4r7t32f08l7j.apps.googleusercontent.com',
    iosBundleId: 'com.tadyuh.beEnergised',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYxrM0UdOCUnpjS1pCHYl6Z88rwC4kb0c',
    appId: '1:480880931433:ios:1db8126c46b26a2228a8f8',
    messagingSenderId: '480880931433',
    projectId: 'be-energised',
    storageBucket: 'be-energised.appspot.com',
    iosClientId: '480880931433-apqfhqdd1a52jhhl6fge4r7t32f08l7j.apps.googleusercontent.com',
    iosBundleId: 'com.tadyuh.beEnergised',
  );
}
