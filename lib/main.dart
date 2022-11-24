import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'loginpage.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAyqwYfvQB2tWnmo8URm5HUyA5BY00oJHc',
      appId: '1:250137166837:android:e917b5859585c38b1d56bc',
      messagingSenderId: '250137166837',
      projectId: 'news-app-a72fd',
      authDomain: 'https://news-app-a72fd-default-rtdb.asia-southeast1.firebasedatabase.app',
      databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      storageBucket: 'news-app-a72fd.appspot.com',
      //measurementId: 'G-F79DJ0VFGS',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS API TEST WITH FIREBASE AUTH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}


