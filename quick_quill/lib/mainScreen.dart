import 'package:flutter/material.dart';

import 'noteMain.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key?key}):super(key:key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  int _currentIndex=1;
  final List<Widget> _pages=[
    SchedulingPage(),
    NoteMain(),
    MoodJournalingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: const Icon(Icons.edit),
        title: const Text('Quick Quill',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle),),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Scheduling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            label: 'Mood Journaling',
          ),
        ],
      ),
    );
  }
}
