import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/cart_button.dart';

import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({super.key});

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  int radioValue = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
    // _fetchUserAddresses();
  }

  Future<List<Map<dynamic, dynamic>>?> getUserAddresses() async {
    var box = await Hive.openBox('users_address');

    String? phoneno = await getphonono();
    List<dynamic>? addresses = await box.get(phoneno);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();

      return convertedAddresses;
    } else {
      return null;
    }
  }

  Future<void> deleteAddress(int index) async {
    var box = await Hive.openBox('users_address');

    String? phoneno = await getphonono();
    List<dynamic>? addresses = await box.get(phoneno);

    if (addresses != null && index >= 0 && index < addresses.length) {
      addresses.removeAt(index);
      //await box.put(phoneno, addresses);
    }
    
    setState(() {});
  }


  Future<String?> getphonono() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber');
  }

  List<Map<dynamic, dynamic>>? userAddresses;

  Future<void> _fetchUserAddresses() async {
    List<Map<dynamic, dynamic>>? addresses = await getUserAddresses();
    if (addresses != null) {
      setState(() {
        userAddresses = addresses;
      });
    } else {
      return debugPrint('No user data found for phoneno: ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.bodyColor,
          appBar: AppBar(
            backgroundColor: AppColors.originalWhite,
            leading: ArrowBack(
              color: Colors.black,
            ),
            title: appBarTitle('Manage Address', 20.sp, AppColors.green),
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
            child: FutureBuilder(
                future: _fetchUserAddresses(),
                builder: (context, snapshot) {
                  return Column(
          
                    children: [
                      Column(
                        children:
                            List.generate(userAddresses?.length ?? 0, (index) {
                          var address = userAddresses![index];
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: 20.h, bottom: 20.h, right: 20.w),
                                margin: EdgeInsets.only(
                                    left: 15.w, right: 15.w, top: 15.h),
                                decoration: BoxDecoration(
                                    color: AppColors.originalWhite,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r)),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10.r,
                                          offset: const Offset(0, 0),
                                          spreadRadius: 0.2,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.1))
                                    ]),
                                child: Row(children: [
                                  Radio(
                                    value: index,
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return AppColors.green.withOpacity(.32);
                                      }
                                      return AppColors.green;
                                    }),
                                    groupValue: radioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        radioValue = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      address['unit'] +
                                          " " +
                                          address['address'] +
                                          " " +
                                          address['state'] +
                                          " " +
                                          address['city'] +
                                          " " +
                                          address['zipcode'],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: getTextStyle(FontWeight.normal,
                                          16.sp, AppColors.black1),
                                    ),
                                  )
                                ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10.r,
                                              offset: const Offset(-5, 5),
                                              spreadRadius: 0.2,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.1))
                                        ],
                                        color: AppColors.originalWhite,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.r)),
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade200,
                                                width: 1),
                                            right: BorderSide(
                                                color: Colors.grey.shade200,
                                                width: 2)),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await deleteAddress(index);
                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Icon(
                                                Icons.delete_outline,
                                                size: 25.h,
                                                color: AppColors.red,
                                              ),
                                            ),
                                            Text(
                                              'Delete',
                                              style: getTextStyle(
                                                  FontWeight.normal,
                                                  18.sp,
                                                  AppColors.black1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(right: 15.w),
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10.r,
                                              offset: const Offset(5, 5),
                                              spreadRadius: 0.2,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.1))
                                        ],
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.r)),
                                        color: AppColors.originalWhite,
                                        border: Border(
                                          top: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/editaddress',
                                              arguments: index);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: Icon(
                                                Icons.edit,
                                                size: 25.h,
                                              ),
                                            ),
                                            Text(
                                              'Cancle',
                                              style: getTextStyle(
                                                  FontWeight.normal,
                                                  18.sp,
                                                  AppColors.black1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                            ],
                          );
                        }),
                      ),
                      Center(
                        child: TextButton.icon(
                          
                            onPressed: () {
                              Navigator.pushNamed(context, '/addnewaddress');
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.green,
                            ),
                            label: Text(
                              'Add New',
                              style: getTextStyle(
                                  FontWeight.w600, 16.sp, AppColors.green),
                            )),
                      )
                    ],
                  );
                }),
          )),
    );
  }
}
