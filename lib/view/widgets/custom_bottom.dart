import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({Key? key, this.onTap}) : super(key: key);
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(
          child: Text('Add',style: TextStyle(
              color: Colors.black
          ),),
        ),
      ),
    );
  }
}