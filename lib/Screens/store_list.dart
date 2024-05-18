import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Model/stores.dart';
import 'package:march_27/Widgets/cart_button.dart';
import 'package:march_27/Widgets/custom_card.dart';
import 'package:march_27/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  int storeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100.withOpacity(0.1),
      appBar: AppBar(
        elevation: 25,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: const Color(0xFFFFFFFF),
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 15.w),
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                iconSize: 28.w,
                color: Colors.black,
                onPressed: () {},
              ),
              Positioned(
                  top: 12,
                  right: 8,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.green,
                    foregroundColor: Colors.white,
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 6.sp),
                    ),
                  ))
            ],
          ),
        ),
        title: appBarTitle("Huge Basket", 20.sp, AppColors.green),
        centerTitle: true,
        actions: [
          CartButton(
              color: const Color.fromRGBO(0, 0, 0, 1),
              onPressed: () {
                Navigator.pushNamed(context, '/viewcart');
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          5.verticalSpace,
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.nextDelivery,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.green),
              // style: getTextStyle(FontWeight.w500, 16.sp, AppColors.green),
            ),
          ),
          10.verticalSpace,
          Column(
              children: List.generate(
            storeList.length,
            (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    storeIndex = index;

                    Navigator.pushNamed(context, '/storedetails',
                        arguments: storeIndex);
                  });
                },
                child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: CustomCard(
                      storeIndex: index,
                    ))),
          ))
        ]),
      ),
    );
  }
}
