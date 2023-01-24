import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/costum_text_field.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: const EdgeInsets.all(16),

      child:  Column(
        children:  const [

          CustomTextField(hint: 'Title'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(hint: 'Content',maxLines: 5,)
      ],
      ),),
    );
  }
}
