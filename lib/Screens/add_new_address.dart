import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/common_button.dart';
import 'package:march_27/Widgets/common_textfield.dart';
import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  List<FocusNode> focusNodes = List.generate(7, (index) => FocusNode());

  final formKey = GlobalKey<FormState>();

  List<TextEditingController> controllerList = List.generate(
    6,
    (index) => TextEditingController(),
  );

  void saveAddressDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneno = pref.getString('phoneNumber');

    if (phoneno != null) {
      var box = await Hive.openBox('users_address');
      List<Map<dynamic, dynamic>>? userAddresses =
          box.get(phoneno)?.cast<Map<dynamic, dynamic>>();

      userAddresses = userAddresses ?? [];

      userAddresses.add({
        'address': controllerList[0].text,
        'unit': controllerList[1].text,
        'city': controllerList[2].text,
        'state': controllerList[3].text,
        'zipcode': controllerList[4].text,
        'instruction': controllerList[5].text,
      });

      box.put(phoneno, userAddresses);
    }

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i] = FocusNode();
    }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < controllerList.length; i++) {
      controllerList[i].clear();
      controllerList[i].dispose();
    }
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].dispose();
    }
  }

  bool validateZipcode() {
    if (controllerList[4].text.length != 6) {
      return false;
    }
    return true;
  }

  bool validateAddress() {
    for (int i = 0; i < controllerList.length; i++) {
      var controller = controllerList[i].text;
      if (controller.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.originalWhite,
      appBar: AppBar(
        backgroundColor: AppColors.originalWhite,
        leading: ArrowBack(
          color: Colors.black,
        ),
        title: appBarTitle('Add New Address', 20.sp, AppColors.green),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: CommonTextField(
                  controller: controllerList[0],
                  textInputType: TextInputType.text,
                  focusNode: focusNodes[0],
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (p0) {
                    focusNodes[0].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[1]);
                  },
                  hintText: 'Address',
                  validator: (value) => null,
                  suffixIcon: const Icon(
                    Icons.location_on,
                    color: Color(0xFF999B9C),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: CommonTextField(
                  controller: controllerList[1],
                  focusNode: focusNodes[1],
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (p0) {
                    focusNodes[1].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[2]);
                  },
                  hintText: 'Enter Unit Number',
                  validator: (value) => null,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: CommonTextField(
                  controller: controllerList[2],
                  focusNode: focusNodes[2],
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (p0) {
                    focusNodes[2].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[3]);
                  },
                  hintText: 'City',
                  validator: (value) => null,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: CommonTextField(
                  controller: controllerList[3],
                  focusNode: focusNodes[3],
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (p0) {
                    focusNodes[3].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[4]);
                  },
                  hintText: 'State',
                  validator: (value) => null,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: CommonTextField(
                  controller: controllerList[4],
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  focusNode: focusNodes[4],
                  onFieldSubmitted: (p0) {
                    focusNodes[4].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[5]);
                  },
                  hintText: 'Zipcode',
                  validator: (value) => null,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.h),
                child: TextFormField(
                  controller: controllerList[5],
                  focusNode: focusNodes[5],
                  onFieldSubmitted: (p0) {
                    focusNodes[5].unfocus();
                    FocusScope.of(context).requestFocus(focusNodes[6]);
                  },
                  keyboardType: TextInputType.multiline,
                  validator: (value) => null,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
                    hintText: 'Delivery Instruction',
                    fillColor: const Color(0xFFF3F4F6),
                    filled: true,
                    hintStyle: const TextStyle(color: Color(0xFF999B9C)),
                  ),
                ),
              ),
              50.verticalSpace,
              CommonButton(
                  text: 'Add',
                  fontSize: 18.sp,
                  focusNode: focusNodes[6],
                  onPressed: () {
                    if (validateAddress() == true) {
                      if (validateZipcode() == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Zipcode must be in 6 digits')),
                        );
                      } else {
                        validateAddress();
                        saveAddressDetails();
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  horizontalPadding: 120.w,
                  verticalpadding: 15.h)
            ]),
          ),
        ),
      ),
    ));
  }
}
