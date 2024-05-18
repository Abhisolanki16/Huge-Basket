import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/types/gf_border_type.dart';
import 'package:march_27/Model/productModel.dart';
import 'package:march_27/constants.dart';

// ignore: must_be_immutable
class CustomProductCard extends StatefulWidget {
  CustomProductCard(
      {super.key,
      // required this.isTapped,
      required this.product});
  // bool? isTapped;
  ProductModel product;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool loadingData = false;
  Future<bool> loadData() {
    return Future.delayed(const Duration(seconds: 3), () {
      return loadingData = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.w),
      padding: EdgeInsets.all(15.w),
      width: 160.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 16.r,
                spreadRadius: 1,
                offset: const Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(10.r),
          color: const Color.fromRGBO(255, 255, 255, 1)),
      child: Stack(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(top: 15.h, bottom: 15.h, right: 20.w),
                    child: FutureBuilder(
                      future: loadData(),
                      builder: (context, snapshot) {
                        if (loadingData == true) {
                          return Image.asset(
                            widget.product.productImg,
                            height: 60,
                            width: 60,
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                    Text(
                      widget.product.productWeight,
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                ),
                //5.verticalSpace,
                Text(
                  widget.product.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getTextStyle(
                      FontWeight.normal, 15.sp, const Color(0xFF301934)),
                ),
                //10.verticalSpace,
              ]),
          ValueListenableBuilder(
            valueListenable: widget.product.count,
            builder: (context, value, child) {
              if (widget.product.count.value > 0) {
                return openContainer();
              } else {
                return closeContainer();
              }
            },
          )
        ],
      ),
    );
  }

  Positioned closeContainer() {
    return Positioned(
      right: 0,
      child: GFBorder(
        type: GFBorderType.circle,
        padding: const EdgeInsets.all(0),
        color: AppColors.green,
        child: Container(
          height: 30.h,
          width: 30.w,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(68, 177, 44, 0.1), shape: BoxShape.circle),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: AppColors.green,
                size: 15,
              ),
              onPressed: () {
                // widget.isTapped = !widget.isTapped;
                widget.product.count.value++;
              },
            ),
          ),
        ),
      ),
    );
  }

  Positioned openContainer() {
    return Positioned(
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF44B12C)),
            borderRadius: BorderRadius.circular(
              20.r,
            )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: () {
                    widget.product.count.value++;
                  },
                  child: Icon(Icons.add, size: 15.w)),
              8.verticalSpace,
              ValueListenableBuilder(
                valueListenable: widget.product.count,
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  );
                },
              ),
              8.verticalSpace,
              GestureDetector(
                  onTap: () {
                    if (widget.product.count.value > 0) {
                      widget.product.count.value--;
                    }
                  },
                  child: ValueListenableBuilder(
                    valueListenable: widget.product.count,
                    builder: (context, value, child) {
                      return Icon(
                        value < 1
                            ? Icons.delete_outlined
                            : Icons.remove_outlined,
                        color: const Color(0xFFFF4848),
                      );
                    },
                  )),
            ]),
      ),
    );
  }
}
