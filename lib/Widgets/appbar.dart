import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/back_button.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  CustomAppBar({super.key,required this.appbarTitle, this.iconColor});
  String appbarTitle;
  Color? iconColor;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: const Color(0xFFFFFFFF),
        leading: ArrowBack(
          color: widget.iconColor,
        ),
        centerTitle: true,
        title: Text(
          widget.appbarTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: const Color(0xFF44B12C)),
        ),
      ),
    );
  }
}
