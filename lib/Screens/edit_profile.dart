import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:march_27/Model/validators.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/common_button.dart';
import 'package:march_27/Widgets/common_textfield.dart';
import 'package:march_27/Widgets/mobile_textfield.dart';
import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
    _loadFormData();
  }

  Future<void> _loadFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneno = prefs.getString('phoneNumber');
    var jsonData = localStorage.getItem(phoneno!);
    var userData = jsonDecode(jsonData!);


    // var box = await Hive.openBox('user_data');

    //var userData = await box.get(phoneno);
    if (userData != null) {
      setState(() {
        controllers[0].text = userData['businessName'];
        controllers[1].text = userData['firstName'];
        controllers[2].text = userData['lastName'];
        controllers[3].text = userData['email'];
        controllers[4].text = userData['phone'];
        controllers[5].text = userData['zipcode'];
      });
    } else {
      debugPrint(userData);
    }
  }

  // void getSharedPrefData() async{

  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   controllers[0].text =preferences.getString('bussinessName')!;
  //   controllers[1].text =preferences.getString('firstName')!;
  //   controllers[2].text =preferences.getString('lastName')!;
  //   controllers[3].text =preferences.getString('emailAddress')!;
  //   controllers[4].text =preferences.getString('mobileNumber')!;
  //   controllers[5].text =preferences.getString('zipcode')!;

  // }

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: ArrowBack(
            color: Colors.black,
          ),
          title: appBarTitle("Edit Profile", 20.sp, AppColors.green),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              20.verticalSpace,
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
              60.verticalSpace,
              CommonButton(
                  text: "Update",
                  fontSize: 18.sp,
                  focusNode: submit,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? phoneno = prefs.getString('phoneNumber');
                    if (formKey.currentState!.validate()) {
                      // Navigator.pushReplacementNamed(context, '/bottomMenu');


                     // var box = await Hive.openBox('user_data');
                      
                      
                      Map<String, dynamic> userDataProfile = {
                        'businessName': controllers[0].text,
                        'firstName': controllers[1].text,
                        'lastName': controllers[2].text,
                        'email': controllers[3].text,
                        'phone': controllers[4].text,
                        'zipcode': controllers[5].text,
                      };
                      var jsonEncodeData = jsonEncode(userDataProfile);
                      localStorage.setItem(phoneno!, jsonEncodeData);

                     // await box.put(phoneno, userDataProfile);
                      Navigator.pop(context);

                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomMenuScreen()));
                      controllers.clear;
                    }
                  },
                  horizontalPadding: 130.w,
                  verticalpadding: 18.h),
              25.verticalSpace,
            ]),
          ),
        ),
      ),
    );
  }
}
