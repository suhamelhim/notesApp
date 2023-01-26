import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/bloc_observer.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/view/notes_view.dart';

import 'constants/constants.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer=SimpleBlocObserver();
 await Hive.openBox(kNoteBox);
 Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins'
      ),
      home: const NotesView(

      ),
    );
  }
}
