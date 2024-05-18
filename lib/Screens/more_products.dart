import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:march_27/Model/product.dart';
import 'package:march_27/Model/productModel.dart';
// ignore: unused_import
import 'package:march_27/Screens/product_details.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/cart_button.dart';
import 'package:march_27/Widgets/product_card_custom.dart';
import 'package:march_27/constants.dart';

class MoreProducts extends StatefulWidget {
  const MoreProducts({super.key});

  @override
  State<MoreProducts> createState() => _MoreProductsState();
}

class _MoreProductsState extends State<MoreProducts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.originalWhite,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> product =
        ModalRoute.of(context)!.settings.arguments as List<ProductModel>;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: const Color(0xFFFFFFFF),
        leading: ArrowBack(
          color: Colors.black,
        ),
        title: appBarTitle(
          "Milk",
          20.sp,
          const Color(0xFF44B12C),
        ),
        centerTitle: true,
        actions: [CartButton(color: Colors.black,)],
      ),
      body: GridView.builder(
        itemCount: product.length,
        padding: EdgeInsets.only(right: 15.w, top: 15.h),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 7 / 9),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/productdetails',
                  arguments: product[index]);
            },
            child: CustomProductCard(
              product: product[index],
              // isTapped: false,
              // quantity: 2,
            ),
          );
        },
      ),
    ));
  }
}
