import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ArrowBack extends StatelessWidget {
   ArrowBack({
    super.key,
this.color
  });
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      
        child: IconButton(
      iconSize: 30.w,
      icon:  Icon(
        Icons.keyboard_arrow_left,
        color: color,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ));
  }
}
