import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class ListViewCircle extends StatefulWidget {
  ListViewCircle({super.key, required this.itemList});
  List itemList;

  @override
  State<ListViewCircle> createState() => _ListViewCircleState();
}

class _ListViewCircleState extends State<ListViewCircle> {
  int selectedCategoryIndex = 0;
  bool loadingData = false;

  Future<bool> loadData() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return loadingData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      alignment: Alignment.center,
      height: 140.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.itemList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 70.h,
                    width: 70.h,
                    margin: EdgeInsets.only(
                      right: 15.w,
                      left: 15.w,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFFFFF),
                        border: selectedCategoryIndex == index
                            ? Border.all(color: AppColors.green, width: 1)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: selectedCategoryIndex == index
                                ? const Color.fromRGBO(8, 255, 0, 0.17)
                                : const Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 16,
                            offset: const Offset(0, 0),
                            spreadRadius: 1,
                          )
                        ]),
                    child: FutureBuilder(
                      future: loadData(),
                      builder: (context, snapshot) {
                        if (loadingData == true) {
                          return Image.asset(
                            widget.itemList[index].imgUrl,
                            height: 40,
                            width: 40,
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  widget.itemList[index].title,
                  style: getTextStyle(
                      FontWeight.bold,
                      14.sp,
                      (selectedCategoryIndex == index)
                          ? const Color.fromRGBO(68, 177, 44, 1)
                          : const Color.fromRGBO(0, 0, 0, 1)),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
