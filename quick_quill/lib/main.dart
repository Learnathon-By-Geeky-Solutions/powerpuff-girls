import 'package:flutter/material.dart';
import 'package:quick_quill/log_in.dart';
import 'package:quick_quill/noteMain.dart';
import 'package:quick_quill/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Quill',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NoteMain(),
    );
  }
}


