import 'dart:io';

import 'package:appdid/view/home.dart';
import 'package:appdid/view/meal_detail.dart';
import 'package:appdid/view/meals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:appdid/view/splashScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('App starting...');

  // Initialize Firebase
  await Firebase.initializeApp();
  print('Firebase initialized');




  runApp(
    // Wrap your entire app with ProviderScope
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // Time when the app went to background (for tracking background time)
  DateTime? _pausedTime;

  // Use the global instance
  // No need to create a new instance here

  // Minimum time app needs to be in background to show ad when resumed
  final Duration _minBackgroundDuration = const Duration(seconds: 30);
  bool _isInitialAdShown = false;

  @override
  void initState() {
    super.initState();
    print('MyApp initializing...');
    WidgetsBinding.instance.addObserver(this);



  }

  @override
  void dispose() {
    print('Disposing MyApp');
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',  // This will point to MysplashScreen now
      routes: {
        '/': (context) => const MysplashScreen(),
        '/random': (context) => HomeScreen(),
      },
    );




  }
}