import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../constants/constants.dart';
import '../../models/notes_model.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> ? notes;
  fetchAllNotes () async {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      List<NoteModel> notes=noteBox.values.toList();
      notes=noteBox.values.toList();


  }

}
