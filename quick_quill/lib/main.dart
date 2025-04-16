import 'package:flutter/material.dart';
import 'package:quick_quill/log_in.dart';
import 'package:quick_quill/noteMain.dart';
import 'package:quick_quill/sign_up.dart';
import 'package:quick_quill/welcome_page_animation.dart';

import 'mainScreen.dart';
import 'noteDetails.dart';

void main() {
  runApp(
    const MyApp(),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Quill',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),


        initialRoute: '/main_screen',
        routes: {
          '/': (context) => LogInPage(),
          '/sign_up': (context) => SignUpPage(),
          '/note_main': (context) => NoteMain(),
          '/main_screen': (context) => MainScreen(),
          '/scheduling_page': (context) => SchedulingPage(),
          '/mood_journaling_page': (context) => MoodJournalingPage(),
          '/note_detail_page': (context) => NoteDetailPage(),
          '/welcome_page': (context) => WelcomePageAnimation(),
        }
    );
  }
}

