import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ListViewTitle extends StatelessWidget {
   ListViewTitle({super.key,required this.moreItemList,required this.title});
  List moreItemList;
  var title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 246, 238, 1),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
        vertical: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
          title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/moreproducts',
                  arguments: moreItemList);
            },
            child: Text(
              'More >',
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
