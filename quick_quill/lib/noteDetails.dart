import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'noteMain.dart';

class NoteDetailPage extends StatefulWidget{
  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {

    late Note note;
    final TextEditingController _controller = TextEditingController();
    bool _isPalleteExpanded=false;
    bool _isTrayExpanded=false;
    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      note = ModalRoute.of(context)!.settings.arguments as Note;
      _controller.text=note.content;
    }
  void _saveNote() {
      setState(() {
        note.content=_controller.text;
      });
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.amber,
         actions: [
           IconButton(onPressed: (){}, icon: Icon(Icons.mic,
           color: Colors.blue,)),
           IconButton(onPressed: (){
             setState(() {
               _isPalleteExpanded=!_isPalleteExpanded;
             });
           }, icon: Icon(Icons.palette_outlined,
           color: _isPalleteExpanded?Colors.white:Colors.black,)),
           IconButton(onPressed: _saveNote, icon: Icon(Icons.save,
           color: Colors.purpleAccent,)),
         ],
             ),
    body:
              Column(
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: _isPalleteExpanded?60:0,
                      // width: 400,
                      color: Colors.purpleAccent,
                      child: _isPalleteExpanded ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_bold,),
                            color: Colors.black,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_italic,),
                              color: Colors.black,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_underline,),
                              color: Colors.black,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_paint,),
                              color: Colors.white,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_list_bulleted,),
                              color: Colors.red,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.format_list_numbered,),
                              color: Colors.red,),

                            ],
                        ):null,
                    ),
                  Padding(padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    right: 100,
                    child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                            height: _isTrayExpanded?250:0,
                            width: 60,
                            color: Colors.purpleAccent,
                            child: _isTrayExpanded ?
                            Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.file_copy_outlined,),
                            color: Colors.greenAccent,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.pie_chart,),
                            color: Colors.orangeAccent,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.picture_as_pdf,),
                            color: Colors.redAccent,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.share,),
                            color: Colors.greenAccent,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo,),
                            color: Colors.cyanAccent,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.handyman,),
                            color: Colors.black,),

                            ],
                            ):null,
                            ),
                  ),
                ],
              ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isTrayExpanded=!_isTrayExpanded;
        });
      },
      backgroundColor: Colors.cyanAccent,
        child: Icon(Icons.arrow_circle_up_rounded,
        color: Colors.white,),
      ),
    );
  }
}
