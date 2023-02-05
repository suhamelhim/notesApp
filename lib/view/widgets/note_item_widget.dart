
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/notes_model.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({Key? key,required this.notes}) : super(key: key);
final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color:const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16)
      ),

      child: Padding(
        padding: const EdgeInsets.all( 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(notes.title,
                style: const TextStyle(
                fontSize: 30,
                  color: Colors.black

              ),),
              subtitle:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(notes.subtitle,style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5),
                ),),
              ),
              trailing: IconButton(
                onPressed: () {
                  notes.delete();

                },
                icon: const Icon(FontAwesomeIcons.trash,color: Colors.black,),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 16),
               child: Text(notes.date,style: TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(0.5),)),
             )
          ],
        ),
      ),
    );
  }
}
