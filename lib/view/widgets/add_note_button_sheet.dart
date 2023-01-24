import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'costum_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(right: 16,left: 16,top: 32),
          child: CustomTextField(
            hint: 'Title',
          ),

        ),
        Padding(
          padding: EdgeInsets.only(right: 16,left: 16,bottom: 16,top: 32),
          child: CustomTextField(
            hint: 'Content',
            maxLines: 5,
          ),

        ),

      ],
    );
  }
}


