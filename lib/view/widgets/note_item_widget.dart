
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

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
              title: const Text('Flutter Tips',
                style: TextStyle(
                fontSize: 30,
                  color: Colors.black

              ),),
              subtitle:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Build Your Career Skills With Suha Melhim',style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5),
                ),),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash,color: Colors.black,),
              ),
            ),
             Padding(
               padding: const EdgeInsets.only(right: 16),
               child: Text('May21 ,2022',style: TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(0.5),)),
             )
          ],
        ),
      ),
    );
  }
}
