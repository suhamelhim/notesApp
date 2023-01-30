import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';
import '../../models/notes_model.dart';
import '../add_note_cubit/add_note_state.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes () async {

    try{
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notes=noteBox.values.toList();

      emit(NotesSuccess(notes));

    }catch(e){

      emit(NotesFailure(e.toString()));
    }
  }

}
