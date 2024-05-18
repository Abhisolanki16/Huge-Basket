import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle getTextStyle(FontWeight? weight, double? size, Color? color) {
  return TextStyle(fontWeight: weight, fontSize: size, color: color);
}

class AppColors {
  static const white = Color(0xFFF3F4F6);
  static const green = Color(0xFF44B12C);
  static const black1 = Color(0xFF061E31);
  static const red = Color(0xFFFF4848);
  static const bodyColor = Color(0xFFF5F5F5);
  static const originalWhite = Color(0xFFFFFFFF);
}

Widget sizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget appBarTitle(String text, double fontSize, Color color) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        letterSpacing: 0.5,
        color: color),
  );
}

Widget recieptTile(String title, void Function()? onTap, String discountedPrice,
    String? originalPrice, bool showInfo) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      children: [
        Text(
          title,
          style:
              getTextStyle(FontWeight.normal, 16.sp, const Color(0xFF1E2231)),
        ),
        showInfo
            ? Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: InkWell(
                    onTap: onTap,
                    child: Icon(
                      Icons.info_outline,
                      size: 20.w,
                      color: Colors.grey,
                    )),
              )
            : Container(),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(originalPrice ?? '',
              style: TextStyle(
                  color: const Color.fromRGBO(30, 34, 49, 1).withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  decoration: TextDecoration.lineThrough)),
        ),
        Text(
          discountedPrice,
          style: getTextStyle(FontWeight.w500, 15.sp, const Color(0xFF1E2231)),
        )
      ],
    ),
  );
}

Widget textButton(void Function()? onPressed, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.w,
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: getTextStyle(FontWeight.w500, 15.sp, AppColors.green)),
    ),
  );
}

Widget textButtonWithIcon(void Function()? onPressed, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.add_circle_outline_rounded,
          color: AppColors.green,
        ),
        label: Text(
          text,
          style: getTextStyle(FontWeight.w500, 15.sp, AppColors.green),
        )),
  );
}
