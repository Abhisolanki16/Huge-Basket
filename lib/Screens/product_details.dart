import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/cart_items.dart';
// ignore: unused_import
import 'package:march_27/Model/productModel.dart';
import 'package:march_27/Widgets/cart_button.dart';
import 'package:march_27/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;
  int productQuantity = 0;
  bool hideDelete = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));

    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Map<String, List<CartItems>>> itemsMap = [];

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    ProductModel product = args['itemList'];
    final store = args['store'];

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: const Color(0xFFFFFFFF),
        leading: Container(
            child: IconButton(
          iconSize: 30.w,
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        title: appBarTitle(
          "Product Details",
          20.sp,
          const Color(0xFF44B12C),
        ),
        centerTitle: true,
        actions: [
          CartButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/viewcart');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 16.sp,
                      spreadRadius: 3,
                      offset: const Offset(0, 0)),
                ],
                color: const Color(0xFFFFFFFF),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        height: 100,
                        width: 100,
                        child: PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              product.productImg,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: 4,
                          onDotClicked: (index) {
                            controller.jumpToPage(index);
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          effect: const CustomizableEffect(
                              dotDecoration: DotDecoration(
                                  height: 3, width: 13, color: Colors.black),
                              activeDotDecoration: DotDecoration(
                                  height: 3, width: 13, color: Colors.green))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        product.productName,
                        style: getTextStyle(
                            FontWeight.normal, 15.sp, const Color(0xFF301934)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Row(
                        children: [
                          Text(
                            product.price.toString(),
                            style: getTextStyle(FontWeight.bold, 20.sp,
                                const Color(0xFF000000)),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF44B12C),
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  if (product.count.value > 0) {
                                    product.count.value--;
                                    print(
                                        'product is : ${product.productName} and quantity is : ${product.count.value}');
                                  }
                                  if (product.count.value == 0) {
                                    hideDelete = false;
                                  }
                                },
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    child: ValueListenableBuilder(
                                      valueListenable: product.count,
                                      builder: (context, value, child) {
                                        return Icon(
                                          value < 1
                                              ? Icons.delete_outlined
                                              : Icons.remove_outlined,
                                          color: const Color(0xFFFF4848),
                                        );
                                      },
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: ValueListenableBuilder(
                                  valueListenable: product.count,
                                  builder: (context, value, child) {
                                    return Text(
                                      "$value",
                                      style: TextStyle(fontSize: 15.sp),
                                    );
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  product.count.value++;
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const Spacer(),
                          Text(
                            product.productWeight,
                            style: getTextStyle(FontWeight.normal, 15.sp,
                                const Color(0xFF301934)),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            20.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.h),
              color: const Color(0xFFFFFFFF),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Details',
                      style: getTextStyle(
                          FontWeight.bold, 16.sp, const Color(0xFF061E31)),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: getTextStyle(
                          FontWeight.normal, 15.sp, const Color(0xFF000000)),
                    )
                  ]),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.white.withOpacity(0.6),
                spreadRadius: 20,
                offset: const Offset(0, 0)),
          ],
          color: Colors.transparent,
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            if (product.count.value != 0) {
              productDetails.add({
                'store': store,
                'productImg': product.productImg,
                'productName': product.productName,
                'productPrice': product.price,
                'productQuantity': product.count.value,
                'productWeight': product.productWeight,
              });
              Navigator.pushNamed(context, '/viewcart');
              Fluttertoast.showToast(
                  msg: "${product.productName} has been added to the cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: "Product can't be added",
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          icon: const Icon(Icons.shopping_bag),
          label: Text(
            'Add to Cart',
            style:
                getTextStyle(FontWeight.normal, 18.sp, const Color(0xFFFFFFFF)),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r)),
              padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
              backgroundColor: AppColors.green,
              foregroundColor: const Color(0xFFFFFFFF)),
        ),
      ),
    ));
  }
}
