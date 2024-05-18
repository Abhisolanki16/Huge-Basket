import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/productModel.dart';

import '../constants.dart';

// ignore: must_be_immutable
class CartButton extends StatelessWidget {
  CartButton({super.key, this.color , this.product, this.onPressed});
 ProductModel? product;
  Color? color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 15.w),
      child: Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_rounded),
            color: color,
            iconSize: 28.w,
            onPressed: onPressed,
          ),
           Positioned(
              top: 10,
              right: 13,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                child: Text("${product?.count.value ?? 0}",style: TextStyle(fontSize: 6.sp),),
              ))
        ],
      ),
    );
  }
}
