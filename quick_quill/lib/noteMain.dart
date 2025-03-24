import 'package:flutter/material.dart';

class NoteMain extends StatelessWidget {
  const NoteMain({super.key});

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

    );
  }
}


