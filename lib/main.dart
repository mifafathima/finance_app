import 'package:finance_app/Screens/Splash%20screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Model/Add_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Add_data>('data');

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCqy53qrV61SpDHs_vcLtAOWZrrBrZcKFE",
        appId: "1:51666434695:android:88bf6505c9516e3ff09622",
        messagingSenderId: '',
        projectId: "finance-app-af766"
    )
  );
  //User? user = FirebaseAuth.instance.currentUser;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      home: SplashScreen()
    );
  }
}

