import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/view/widgets/add_note_button_sheet.dart';
import 'package:notes_app/view/widgets/notes_view_body.dart';

import '../cubits/notes_cubit/notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context, builder: (context) {
                return const AddNoteButtonSheet();
              });
            }),

        body:

        const NotesViewBody(),


      ),
    );
  }
}

