import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  CommonButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.horizontalPadding,
      required this.verticalpadding,
      this.focusNode,
      this.fontSize});

  String text = '';
  void Function()? onPressed;
  double? fontSize = 0.0;
  double horizontalPadding = 0.0;
  double verticalpadding = 0.0;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        focusNode: focusNode,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),
            backgroundColor: AppColors.green,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalpadding),
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ));
  }
}
