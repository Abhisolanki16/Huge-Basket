import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Services/otp_varification.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/constants.dart';
import 'package:march_27/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Widgets/common_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  //int inputOtp = 0;
  final Random random = Random();
  OtpVarification otpVarification = OtpVarification();
  int otp = 0;
  void generateRandomNumber() {
    otp = 1000 + random.nextInt(9000);
    final snackBar = SnackBar(content: Text("Your OTP is $otp"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;
  int givenOtp = 0;

  final int otpLength = 4;

  @override
  void initState() {
    super.initState();
    focusNodes = List<FocusNode>.generate(otpLength, (index) => FocusNode());
    controllers = List<TextEditingController>.generate(
        otpLength, (index) => TextEditingController());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
  }

  @override
  void dispose() {
    for (var i = 0; i < otpLength; i++) {
      focusNodes[i].dispose();
      controllers[i].dispose();
    }
    super.dispose();
  }

  List<int> inputOtp = [];

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
        centerTitle: true,
        title: Text(
          "Verification Code",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: const Color(0xFF44B12C)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(children: [
            60.verticalSpace,
            Text(
              "Verification code has been send on your registered mobile number. Enter Verification code here.",
              textAlign: TextAlign.center,
              style: getTextStyle(FontWeight.w500, 18.sp, Colors.black),
            ),
            27.verticalSpace,
            Row(
                children: List.generate(
              4,
              (index) => Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controllers[index],
                    decoration: InputDecoration(
                        counter: const SizedBox.shrink(),
                        fillColor: const Color(0xFFF3F4F6),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.r),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '-',
                        hintStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    focusNode: focusNodes[index],
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      for (int i = 0; i < value.length; i++) {
                        inputOtp.add(int.parse(value));
                        print(inputOtp);
                      }

                      String joinedOtp = inputOtp.join('');
                      givenOtp = int.parse(joinedOtp);
                      print(givenOtp);
                      if (value.length == 1 && index < otpLength - 1) {
                        focusNodes[index].unfocus();
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        focusNodes[index].unfocus();
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - 1]);
                      }
                    },
                  ),
                ),
              ),
            )),
            40.verticalSpace,
            CommonButton(
              horizontalPadding: 120.w,
              verticalpadding: 15.h,
              onPressed: () {
                print(otp);
                print(givenOtp);
                if (otp == 0) {
                  const snackBar =
                      SnackBar(content: Text("Generate otp first"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (givenOtp.toString().length != 4) {
                  for (int i = 0; i < controllers.length; i++) {
                    controllers[i].clear();
                    inputOtp.clear();
                  }
                  FocusScope.of(context).requestFocus(focusNodes[0]);
                  const snackBar =
                      SnackBar(content: Text("Please enter valid OTP"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (givenOtp != otp) {
                  for (int i = 0; i < controllers.length; i++) {
                    controllers[i].clear();
                    inputOtp.clear();
                  }
                  FocusScope.of(context).requestFocus(focusNodes[0]);
                  const snackBar = SnackBar(content: Text("OTP did not match"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (givenOtp == otp) {
                  const snackBar =
                      SnackBar(content: Text("Varified Successfully"));
                  Navigator.pushReplacementNamed(context, "/moredetails");

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              text: "Verify",
              fontSize: 20.sp,
            ),
            25.verticalSpace,
            TextButton(
              child: Text(AppLocalizations.of(context)!.resendCode,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 15.sp,
                      color: Colors.black)),
              onPressed: () {
                generateRandomNumber();
              },
            ),
            20.verticalSpace,
            Container(
              height: 150.h,
              width: 150.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      opacity: 0.2,
                      fit: BoxFit.fill,
                      image: Assets.logo.image().image)),
            )
          ]),
        ),
      ),
    ));
  }
}
