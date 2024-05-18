import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:march_27/Model/validators.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/common_button.dart';
import 'package:march_27/Widgets/common_textfield.dart';
import 'package:march_27/Widgets/mobile_textfield.dart';
import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMoreDetails extends StatefulWidget {
  const AddMoreDetails({super.key});

  @override
  State<AddMoreDetails> createState() => _AddMoreDetailsState();
}

class _AddMoreDetailsState extends State<AddMoreDetails> {
  final formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;

  late FocusNode bname;
  late FocusNode fname;
  late FocusNode lname;
  late FocusNode email;
  late FocusNode phone;
  late FocusNode zipcode;
  late FocusNode submit;

  @override
  void initState() {
    super.initState();
    bname = FocusNode();
    fname = FocusNode();
    lname = FocusNode();
    email = FocusNode();
    phone = FocusNode();
    zipcode = FocusNode();
    submit = FocusNode();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
  }

  void  saveFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('phoneNumber');

    if (formKey.currentState!.validate()) {
      
      //var box = await Hive.openBox('user_data');

      Map<String, dynamic> userDataProfile = {
        'businessName': controllers[0].text,
        'firstName': controllers[1].text,
        'lastName': controllers[2].text,
        'email': controllers[3].text,
        'phone': controllers[4].text,
        'zipcode': controllers[5].text,
      };

      String userDataJson = jsonEncode(userDataProfile);
      print(userDataJson);

      localStorage.setItem(key!,userDataJson);


      //await box.put(key, userDataProfile);
      debugPrint(key);

      Navigator.pushNamedAndRemoveUntil(
          context, '/bottomMenu', (route) => false);
    }
  }

  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].clear();
      controllers[i].dispose();
    }
    bname.dispose();
    fname.dispose();
    lname.dispose();
    email.dispose();
    phone.dispose();
    zipcode.dispose();
    submit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.originalWhite,
        appBar: AppBar(
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.2),
          backgroundColor: const Color(0xFFFFFFFF),
          leading: ArrowBack(
            color: Colors.black,
          ),
          title: appBarTitle("Add More Details", 20.sp, AppColors.green),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              30.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: CommonTextField(
                    controller: controllers[0],
                    focusNode: bname,
                    hintText: "Bussiness Name",
                    onFieldSubmitted: (p0) {
                      bname.unfocus();
                      FocusScope.of(context).requestFocus(fname);
                    },
                    validator: (value) => validateField(value),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: CommonTextField(
                    controller: controllers[1],
                    focusNode: fname,
                    onFieldSubmitted: (p0) {
                      fname.unfocus();
                      FocusScope.of(context).requestFocus(lname);
                    },
                    hintText: "First Name",
                    validator: (value) => validateField(value),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: CommonTextField(
                    controller: controllers[2],
                    focusNode: lname,
                    onFieldSubmitted: (p0) {
                      lname.unfocus();
                      FocusScope.of(context).requestFocus(email);
                    },
                    hintText: "Last Name",
                    validator: (value) => validateField(value),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: CommonTextField(
                    controller: controllers[3],
                    focusNode: email,
                    onFieldSubmitted: (p0) {
                      email.unfocus();
                      FocusScope.of(context).requestFocus(phone);
                    },
                    hintText: "Email Address",
                    validator: (value) => validateEmail(value),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: MobileTextField(
                    controller: controllers[4],
                    validator: (value) => validatePhoneNumber(value),
                    focusNode: phone,
                    onFieldSubmitted: (p0) {
                      phone.unfocus();
                      FocusScope.of(context).requestFocus(zipcode);
                    },
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: CommonTextField(
                    controller: controllers[5],
                    focusNode: zipcode,
                    onFieldSubmitted: (p0) {
                      zipcode.unfocus();
                      FocusScope.of(context).requestFocus(submit);
                    },
                    hintText: "Zipcode",
                    validator: (value) => validateZipcode(value),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number),
              ),
              10.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),      
                child: Row(
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      activeColor: const Color(0xFF44B12C),
                      onChanged: (value) {
                        setState(() {
                          checkBoxValue = value!;
                        });
                      },
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "I agree to the ",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xFF5B5B5B),
                        ),
                      ),
                      TextSpan(
                        text: "Terms & Condition",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: const Color(0xFF44B12C),
                        ),
                      )
                    ])),
                  ],
                ),
              ),
              60.verticalSpace,
              CommonButton(
                  text: "Add",
                  fontSize: 20.sp,
                  focusNode: submit,
                  onPressed: ()  {
                    if (formKey.currentState!.validate()) {
                      if (checkBoxValue == true) {
                        // SharedPreferences preferences =
                        //     await SharedPreferences.getInstance();
                        // await preferences.setString(
                        //     'bussinessName', controllers[0].text);
                        // await preferences.setString(
                        //     'firstName', controllers[1].text);
                        // await preferences.setString(
                        //     'lastName', controllers[2].text);
                        // await preferences.setString(
                        //     'emailAddress', controllers[3].text);
                        // await preferences.setString(
                        //     'mobileNumber', controllers[4].text);
                        // await preferences.setString(
                        //     'zipcode', controllers[5].text);
                        // Navigator.pushReplacementNamed(context, '/bottomMenu');
                        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomMenuScreen()));
                        saveFormData();
                        controllers.clear;
                      } else {
                        const snackBar = SnackBar(
                          content: Text("Please accept our terms & conditions"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  horizontalPadding: 150.w,
                  verticalpadding: 18.h),
              25.verticalSpace,
            ]),
          ),
        ),
      ),
    );
  }
}
