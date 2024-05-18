import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(vertical: 3.h),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 246, 238, 1),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.06),
                spreadRadius: 1,
                offset: Offset(0, 0))
          ]),
      padding: EdgeInsets.all(10.w),
      child: Text(
        'Next delivery on Wed, 14 Nov 2020 ',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: getTextStyle(FontWeight.w500, 16.sp, AppColors.green),
      ),
    );
  }
}
