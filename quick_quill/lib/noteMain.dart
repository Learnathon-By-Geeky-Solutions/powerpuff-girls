import 'package:flutter/material.dart';

class Note {
  late final String content;
  late final Color color;
  Note({required this.content, required this.color});
}


class NoteMain extends StatefulWidget {
  const NoteMain({super.key});

  @override
  State<NoteMain> createState() => _NoteMainState();
}

class _NoteMainState extends State<NoteMain> {
  bool _showColorOptions = false;
  final List<Color> _noteColors = [
    Colors.pinkAccent,
    Colors.deepOrangeAccent,
    Colors.amberAccent,
    Colors.cyanAccent,
    Colors.purpleAccent,
    ];
  Color? _selectedColor;
  final List<Note> _notes = [
    Note(content: 'Note 1', color: Colors.cyanAccent),
    Note(content: 'Note 2', color: Colors.deepOrangeAccent),
    Note(content: 'Note 3', color: Colors.pinkAccent),
  ];
  void _toggleColorOptions() {
    setState(() {
      _showColorOptions = !_showColorOptions;
    });
  }
  void _selectColor(Color color) {
    setState(() {
      _selectedColor = color;
      _showColorOptions = false;
      _notes.add(Note(content: 'New Note', color: color));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              if(_showColorOptions)
                Positioned(
                  top: 60,
                  left: 15,
                  child: Column(
                    children: _noteColors
                        .asMap()
                        .entries
                        .map((entry) => AnimatedBuilder(animation: AlwaysStoppedAnimation(_showColorOptions), builder: (context,child)
    {
    return Opacity(opacity: _showColorOptions ? 1:0,
    child: AnimatedContainer(
    duration:  Duration(milliseconds: 300+entry.key*100),
    curve: Curves.easeInOut,
    margin: EdgeInsets.only(top: entry.key==0?0:8.0),
    child: GestureDetector(
      onTap: () => _selectColor(entry.value),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: entry.value,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0,2),
            )
          ],
        ),
      ),
      ),
    ),
    );
    },
    ))
      .toList(),
      ),
  ),
              Column(
                  children: [
                    IconButton(onPressed: _toggleColorOptions, icon: Icon(Icons.add),
                      color: Colors.deepPurpleAccent,
                      iconSize: 32,
                    ),
                  ],
          ),
    ],
          ),
    Expanded(child: Column(
    children: [
    Row(
    children:[
    SizedBox(width: 30,),
    Text('Notes',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold),
    ),
    Spacer(),
      IconButton(onPressed: (){}, icon: Icon(Icons.folder),
    ),
    IconButton(onPressed: (){}, icon: Icon(Icons.filter),
    ),
    ],
    ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
    child: Wrap(
    spacing: 8,
    runSpacing: 8,
    children: _notes
        .map((note)=> GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, '/note_detail_page',
    arguments: note,
    );
    },
    child: SizedBox(
      width: 200,
      height: 200,
      child: Card(
        elevation: 2,
        color: note.color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(note.content),
        ),
      ),
        ),
    ))
        .toList(),
    )

    ),

    ),
    )

    ],
    ),
    ),
    ],
    ),
    );
  }
}




class SchedulingPage extends StatelessWidget {
  const SchedulingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SchedulingPage"));
  }
}

class MoodJournalingPage extends StatelessWidget {
  const MoodJournalingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("MoodJournalingPage"));
  }
}

