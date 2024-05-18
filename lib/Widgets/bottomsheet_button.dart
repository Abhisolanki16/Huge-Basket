import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class BottomSheetButton extends StatefulWidget {
  BottomSheetButton({super.key, required this.buttonName, required this.onTap});
  void Function()? onTap;
  String buttonName;
  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 30.w, bottom: 10.h, right: 30.w),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  color: Colors.white,
                  spreadRadius: 15,
                  blurRadius: 20.r)
            ],
            color: AppColors.green),
        child: Text(
          widget.buttonName,
          style: getTextStyle(FontWeight.w500, 16.sp, Colors.white),
        ),
      ),
    );
  }
}
