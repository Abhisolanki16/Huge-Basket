import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class CartTileTitle extends StatelessWidget {
  CartTileTitle({super.key, required this.storeTitle});
  String storeTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Text(
        storeTitle,
        style: getTextStyle(FontWeight.w500, 18.sp, const Color(0xFF1E2231)),
      ),
    );
  }
}
