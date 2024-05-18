import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/bottomsheet_button.dart';
import 'package:march_27/Widgets/delivery_time.dart';
import 'package:march_27/constants.dart';

class PlaceAnOrder extends StatefulWidget {
  const PlaceAnOrder({super.key});

  @override
  State<PlaceAnOrder> createState() => _PlaceAnOrderState();
}

class _PlaceAnOrderState extends State<PlaceAnOrder> {
  TextEditingController coupenCodeController = TextEditingController();
  bool isApplied = false;
  double tax = 10;
  double priceWithTax = 0;
  double finalPrice = 0.0;
  double discountedAmount = 12.0;

  @override
  Widget build(BuildContext context) {
    double totalPrice = ModalRoute.of(context)!.settings.arguments as double;
    priceWithTax = totalPrice + tax;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(240, 246, 238, 1),
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromRGBO(240, 246, 238, 1).withOpacity(0.5),
        backgroundColor: AppColors.originalWhite,
        title: appBarTitle('Place an Order', 20.sp, AppColors.green),
        centerTitle: true,
        leading: ArrowBack(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DeliveryTime(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 1,
                    offset: Offset(0, 0))
              ], color: Color.fromRGBO(255, 255, 255, 1)),
              child: !isApplied
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: coupenCodeController,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(1.h),
                                      hintText: 'Enter the code here',
                                      hintStyle: TextStyle(
                                          fontSize: 15.sp,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.5)),
                                      floatingLabelStyle:
                                          const TextStyle(color: Colors.black),
                                      border: InputBorder.none)),
                              GFBorder(
                                  dashedLine: const [3, 5],
                                  padding: const EdgeInsets.all(0),
                                  color: const Color.fromRGBO(0, 0, 0, 1)
                                      .withOpacity(0.3),
                                  child: Container())
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              if (coupenCodeController.text != '') {
                                setState(() {
                                  isApplied = true;
                                  finalPrice = priceWithTax - discountedAmount;
                                });
                              }
                            },
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                  color: AppColors.green, fontSize: 16.sp),
                            ))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Text(
                            coupenCodeController.text,
                            style: getTextStyle(
                                FontWeight.w500, 16.sp, AppColors.green),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isApplied = false;
                                coupenCodeController.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel_outlined))
                      ],
                    ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 1,
                    offset: Offset(0, 0))
              ], color: Color.fromRGBO(255, 255, 255, 1)),
              child: Column(
                children: [
                  recieptTile('Sub Total', () {}, '\$ $totalPrice', '', true),
                  recieptTile('Tax', () {}, '\$ $tax', '', true),
                  recieptTile('Service Fee', () {}, '\$0.00', '\$ 2.00', true),
                  recieptTile(
                      'Delivery Fees', () {}, '\$0.00', '\$ 2.00', true),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$ $priceWithTax',
                      style: getTextStyle(FontWeight.bold, 15.sp,
                          const Color.fromRGBO(30, 34, 49, 1)),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: isApplied
                          ? Row(
                              children: [
                                Text(
                                  'Promo Applied (${coupenCodeController.text})',
                                  style: getTextStyle(FontWeight.normal, 16.sp,
                                      const Color(0xFF1E2231)),
                                ),
                                const Spacer(),
                                Text(
                                  '- \$ $discountedAmount',
                                  style: getTextStyle(FontWeight.w500, 15.sp,
                                      const Color(0xFFFF4848)),
                                )
                              ],
                            )
                          : Container()),
                  Container(
                    margin: EdgeInsets.only(left: 300.0.w),
                    child: const Divider(
                      color: Colors.grey,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      children: [
                        Text(
                          'Total Amount',
                          style: getTextStyle(
                              FontWeight.bold, 16.sp, const Color(0xFF1E2231)),
                        ),
                        const Spacer(),
                        Text(
                          '\$ $finalPrice',
                          style: getTextStyle(
                              FontWeight.bold, 15.sp, const Color(0xFF1E2231)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 1,
                    offset: Offset(0, 0))
              ], color: Color.fromRGBO(255, 255, 255, 1)),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
                    child: Text(
                      'Shipping',
                      style: getTextStyle(
                          FontWeight.w600, 16.sp, const Color(0xFF1E2231)),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.5,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              spreadRadius: 2,
                              offset: Offset(0, 0))
                        ],
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.green,
                          radius: 8.r,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 4.r,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, top: 5.h, bottom: 5.h),
                            child: Text(
                              '799 Lost Creek Road,Seattle , Fort Washingtone, Us, 19034 ',
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: getTextStyle(FontWeight.normal, 16.sp,
                                  const Color(0xFF061E31)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textButtonWithIcon(() {}, 'Add New'),
                      textButton(() {}, 'Manage Address')
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 1,
                    offset: Offset(0, 0))
              ], color: Color.fromRGBO(255, 255, 255, 1)),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
                    child: Text(
                      'Payment information',
                      style: getTextStyle(
                          FontWeight.w600, 16.sp, const Color(0xFF1E2231)),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                spreadRadius: 2,
                                offset: Offset(0, 0))
                          ],
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            child: Image.asset(
                              'assets/mastercard.png',
                              height: 35.h,
                              width: 60.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    'Anthony Bailey ',
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: getTextStyle(FontWeight.bold, 16.sp,
                                        const Color(0xFF1E2231)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    '•••• •••• •••• 5678',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: getTextStyle(FontWeight.bold, 16.sp,
                                        const Color(0xFF1E2231)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textButtonWithIcon(() {}, 'Add New'),
                      textButton(() {}, 'Change Card')
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.w),
              child: BottomSheetButton(
                buttonName: 'Place Order',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    ));
  }
}
