import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import '../../cubits/add_note_cubit/add_note_state.dart';
import 'costum_text_field.dart';
import 'custom_bottom.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
    padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print('failed ${state.errorMessage}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: const AddNoteForm());
          },
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          Padding(
            padding:
            const EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 32),
            child: CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'Content',
              maxLines: 5,
            ),
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBottom(

                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var formattedCurrentDate=DateFormat.yMd().format(DateTime.now());
                        var noteModel = NoteModel(
                        title: title!,
                        subtitle: subTitle!,

                        date: formattedCurrentDate.toString(),
                        color: Colors.blueGrey.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
