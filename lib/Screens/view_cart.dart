import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/productModel.dart';
import 'package:march_27/Widgets/bottomsheet_button.dart';
import 'package:march_27/Widgets/cartTile_title.dart';
import 'package:march_27/Widgets/delivery_time.dart';
import 'package:march_27/constants.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({super.key});

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.originalWhite,
        statusBarIconBrightness: Brightness.dark));
    totalPrice = 0.0;
    itemsMap = {};
    getData();
    super.initState();
  }

  getData() {
    for (var item in productDetails) {
      String shopName = item['store'];

      totalPrice += item['productPrice'] * item['productQuantity'];

      if (itemsMap.containsKey(shopName)) {
        setState(() {
          itemsMap[shopName]!.add(item);
          // print(itemsMap[shopName]);
        });
      } else {
        itemsMap[shopName] = [item];
      }
    }
  }

  int selectedStoreIndex = 0;
  late double totalPrice;
  late Map<String, List<Map<dynamic, dynamic>>> itemsMap;

  int calculateTotalItems() {
    int total = 0;
    for (var item in itemsMap.values) {
      total += item.length;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 246, 238, 1),
        appBar: AppBar(
          elevation: 5,
          shadowColor: const Color.fromRGBO(240, 246, 238, 1).withOpacity(0.5),
          backgroundColor: AppColors.originalWhite,
          title: appBarTitle('View Cart', 20.sp, AppColors.green),
          centerTitle: true,
          leading: Container(
              child: IconButton(
            iconSize: 30.w,
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.amber,
            ),
            onPressed: () {
              Navigator.pop(context, productDetails);
            },
          )),
        ),
        bottomSheet: totalPrice > 10
            ? BottomSheetButton(
                buttonName: 'Proceed to Checkout',
                onTap: () {
                  Navigator.pushNamed(context, '/placeanorder',
                      arguments: totalPrice);
                },
              )
            : customBottomSheetButton('\$10 Min. to Checkout', () {}),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DeliveryTime(),
              totalAmount(
                  'Sub Total (${productDetails.length} item) : \$ $totalPrice '),
              Column(
                children: [
                  for (String shopName in itemsMap.keys)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsets.all(16.sp),
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                spreadRadius: 0.3,
                                offset: Offset(0, 0))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartTileTitle(storeTitle: shopName),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: itemsMap[shopName]!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 1.5,
                              );
                            },
                            itemBuilder: (context, index) {
                              var item = itemsMap[shopName]![index];
                              ValueNotifier<int> productQuantity =
                                  ValueNotifier<int>(item['productQuantity']);

                              return cartTile(
                                  item['productImg'],
                                  item['productName'],
                                  item['productPrice'],
                                  productQuantity, () {
                                if (productQuantity.value > 0) {
                                  productQuantity.value--;
                                }
                              }, () {
                                if (productQuantity.value > 0) {
                                  productQuantity.value++;
                                }
                              }, () {
                                setState(() {
                                  itemsMap[shopName]!.removeAt(index);
                                  totalPrice -= item['productPrice'] *
                                      item['productQuantity'];

                                  productDetails.removeWhere(
                                      (item) => item['shopName'] == shopName);
                                });

                                // print(
                                //     "${itemsMap[shopName]![index]} has been removed");
                              }, item['productWeight']);
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customBottomSheetButton(String buttonName, void Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50.h,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 30.w, bottom: 10.h, right: 30.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.white,
                spreadRadius: 15,
                blurRadius: 20.r)
          ],
          color: const Color(0xFFD4D4D4)),
      child: Text(
        buttonName,
        style: getTextStyle(FontWeight.w500, 16.sp, Colors.white),
      ),
    ),
  );
}

Container cartTile(
  String productImg,
  String productName,
  int productPrice,
  ValueNotifier<int> productQuantity,
  void Function()? onMinusPressed,
  void Function()? onPlusPressed,
  void Function()? onDeletePressed,
  String productWeight,
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Row(
      children: [
        SizedBox(
          height: 80.h,
          width: 60.w,
          child: Image.asset(
            productImg,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Text(
                        productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getTextStyle(
                            FontWeight.w500, 14.sp, const Color(0xFF061E31)),
                      ),
                    ),
                    InkWell(
                      onTap: onDeletePressed,
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFFF4848),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    '\$ ' '$productPrice',
                    style: getTextStyle(
                        FontWeight.bold, 14.sp, const Color(0xFF061E31)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productWeight,
                      style: getTextStyle(
                          FontWeight.w500, 14.sp, const Color(0xFF061E31)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onMinusPressed,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 15.w),
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                                color: AppColors.green, shape: BoxShape.circle),
                            child: Icon(
                              Icons.remove,
                              size: 15.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: productQuantity,
                          builder: (context, value, child) {
                            return Text(
                              '$value',
                              style: getTextStyle(FontWeight.normal, 15.sp,
                                  const Color(0xFF061E31)),
                            );
                          },
                        ),
                        InkWell(
                          onTap: onPlusPressed,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15.w),
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                                color: AppColors.green, shape: BoxShape.circle),
                            child: Icon(
                              Icons.add,
                              size: 15.w,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget totalAmount(String amount) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3.h),
    alignment: Alignment.centerLeft,
    width: double.infinity,
    decoration: const BoxDecoration(
        color: Color.fromRGBO(240, 246, 238, 1),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.06),
              spreadRadius: 1,
              offset: Offset(0, 0))
        ]),
    padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w, bottom: 10.h),
    child: Text(
      amount,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: getTextStyle(FontWeight.bold, 16.sp, const Color(0xFF000000)),
    ),
  );
}
