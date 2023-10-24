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
    apiKey: 'AIzaSyA_u-E9hpW9VOI-HkZJO_NNqzua73mqRF4',
    appId: '1:136706446092:web:449514a479735c99c86f29',
    messagingSenderId: '136706446092',
    projectId: 'kuriakose-demo-app',
    authDomain: 'kuriakose-demo-app.firebaseapp.com',
    storageBucket: 'kuriakose-demo-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHT6bLBPY4p7zeDX12bB717HYT-ivH1rA',
    appId: '1:136706446092:android:d955fb2a04e03fe8c86f29',
    messagingSenderId: '136706446092',
    projectId: 'kuriakose-demo-app',
    storageBucket: 'kuriakose-demo-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDzaUYQ8EsIxAVaf56OJmGykC-qlM5798',
    appId: '1:136706446092:ios:ba9c3152497e3dacc86f29',
    messagingSenderId: '136706446092',
    projectId: 'kuriakose-demo-app',
    storageBucket: 'kuriakose-demo-app.appspot.com',
    iosBundleId: 'com.example.kuriakosedemoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDzaUYQ8EsIxAVaf56OJmGykC-qlM5798',
    appId: '1:136706446092:ios:6b030ee18a4d5dc6c86f29',
    messagingSenderId: '136706446092',
    projectId: 'kuriakose-demo-app',
    storageBucket: 'kuriakose-demo-app.appspot.com',
    iosBundleId: 'com.example.kuriakosedemoapp.RunnerTests',
  );
}