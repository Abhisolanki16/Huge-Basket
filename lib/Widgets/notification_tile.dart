import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class CustomNotificationTile extends StatefulWidget {
  CustomNotificationTile(
      {super.key,
      required this.isOrderIdPresent,
      required this.orderId,
      required this.time,
      required this.title});

  String title;
  String orderId;
  String time;
  bool isOrderIdPresent;

  @override
  State<CustomNotificationTile> createState() => _CustomNotificationTileState();
}

class _CustomNotificationTileState extends State<CustomNotificationTile> {
  @override
  Widget build(BuildContext context) {
      
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 85.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFFFFFFF),
      ),
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: CircleAvatar(
            backgroundColor: AppColors.green,
            radius: 20.r,
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getTextStyle(
                    FontWeight.normal, 15.sp, const Color(0xFF061E31)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 widget.isOrderIdPresent == true
                      ? Text(
                          widget.orderId,
                          style: getTextStyle(FontWeight.normal, 14.sp,
                              const Color(0xFF5B5B5B)),
                        )
                      : const SizedBox(),
                  Text(
                    widget.time,
                    style: getTextStyle(
                        FontWeight.normal, 14.sp, const Color(0xFF5B5B5B)),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
