import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'costum_text_field.dart';
import 'custom_bottom.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 32),
      child: SingleChildScrollView(child: AddNoteForm()),
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
        children:  [
          CustomTextField(
            onSaved: (value){
              title=value;
            },
            hint: 'Title',
          ),
           Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 32),
            child: CustomTextField(
              onSaved: (value){
                subTitle=value;
              },
              hint: 'Content',
              maxLines: 5,
            ),
          ),
          CustomBottom(
            onTap: (){
              if (formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else {
                autovalidateMode=AutovalidateMode.always;
              }
              setState(() {


              });
            },

          ),
        ],
      ),
    );
  }
}
