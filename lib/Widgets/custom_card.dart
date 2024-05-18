// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/stores.dart';
import 'package:march_27/constants.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    super.key,
    required this.storeIndex,
  });

   int storeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(
            0.0,
            0.0,
          ),
          blurRadius: 15.0,
          spreadRadius: 2.0,
        ), 
      ], borderRadius: BorderRadius.circular(20.r), color: Colors.white),
      child: Row(children: [
        Stack(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.r),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(storeList[storeIndex].imgPath))),
            ),
            Positioned(
                top: 75,
                right: 30,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 15.w,
                        color: Colors.white,
                      ),
                      Text(
                        storeList[storeIndex].ratings,
                        style: getTextStyle(
                            FontWeight.normal, 12.sp, Colors.white),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        storeList[storeIndex].name,
                        style: getTextStyle(FontWeight.bold, 18.sp, Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      storeList[storeIndex].distance,
                      style: getTextStyle(
                          FontWeight.normal, 12.sp, const Color(0xFF9D9D9D)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                5.verticalSpace,
                Text(
                  storeList[storeIndex].subTitle,
                  style: getTextStyle(
                      FontWeight.normal, 12.sp, const Color(0xFF9D9D9D)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  storeList[storeIndex].discription,
                  style: getTextStyle(
                      FontWeight.normal, 12.sp, const Color(0xFF9D9D9D)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
