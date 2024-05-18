import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/Widgets/mobile_textfield.dart';
import 'package:march_27/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Widgets/common_button.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobController = TextEditingController();

  @override
  void dispose() {
    mobController.clear();
    mobController.dispose();

    super.dispose();
  }

  Future<bool>? isUserLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.containsKey('phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            if (snapshot.hasData && snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/bottomMenu');
              });
            }
          }
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(children: [
                   Center(
                    heightFactor: 2,
                    child: Assets.logo.image(height: 200.h,width: 200.w)
                  ),
                  MobileTextField(
                    controller: mobController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonButton(
                    horizontalPadding: 120.w,
                    verticalpadding: 15.h,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.setString('phoneNumber', mobController.text);
                        Navigator.pushNamed(context, '/otp');
                        //mobController.clear;
                      } else {
                        const snackBar = SnackBar(
                          content: Text("Please enter valid mobile number"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    text:  AppLocalizations.of(context)!.login,
                    fontSize: 18.sp,
                  )
                ]),
              ),
            ),
          );
        },
      ),
    ));
  }
}
