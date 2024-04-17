import 'package:flutter/material.dart';
import 'package:pharmacy/data/medicines.dart';
import 'package:pharmacy/pages/first_page.dart';
import 'package:pharmacy/pages/home_page.dart';
import 'package:pharmacy/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  addMedicinedItemsToFirestore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Login',
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
      home: const FirstPage(),
    );
  }
}
