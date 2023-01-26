import 'dart:ui';

import 'package:hive/hive.dart';
part 'notes_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField( 0)
   String title;
  @HiveField( 1)
   String subtitle;
  @HiveField( 2)
   DateTime date;
  @HiveField( 3)
   Color color;

  NoteModel({required this.title,required this.subtitle,required this.date,required this.color});
}