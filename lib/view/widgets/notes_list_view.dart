
import 'package:flutter/material.dart';
import 'package:notes_app/view/edit_note_view.dart';

import 'note_item_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context,index){
      return  Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return const EditNoteView();
            }));
          },
            child: const NoteItem()),
      );
    });
  }
}
