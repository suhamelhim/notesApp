import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/view/edit_note_view.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'note_item_widget.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes=BlocProvider.of<NotesCubit>(context).notes?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: notes.length ,
              itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return const EditNoteView();
                    }));
                  },
                  child: const NoteItem()
              );
            },
            ),
          );
        }
    );
  }
}
