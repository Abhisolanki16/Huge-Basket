import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:march_27/Widgets/back_button.dart';
import 'package:march_27/Widgets/common_button.dart';
import 'package:march_27/Widgets/common_textfield.dart';
import 'package:march_27/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  List<FocusNode> focusNodes = List.generate(7, (index) => FocusNode());

  final formKey = GlobalKey<FormState>();
  late int addressindex;

  List<TextEditingController> controllerList = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i] = FocusNode();
    }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.originalWhite,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAddressIndex();
    });
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

  void getAddressIndex() {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is int) {
      setState(() {
        addressindex = data;
      });
      getUserAddresses();
    } else {
      debugPrint("something went worng");
    }
  }

  Future<void> editAddress() async {
    var box = await Hive.openBox('users_address');
    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();

      convertedAddresses[addressindex] = {
        'address': controllerList[0].text,
        'unit': controllerList[1].text,
        'city': controllerList[2].text,
        'state': controllerList[3].text,
        'zipcode': controllerList[4].text,
        'instruction': controllerList[5].text,
      };

      await box.put(token, convertedAddresses);

      Navigator.pop(context);
    }
  }

  Future getUserAddresses() async {
    var box = await Hive.openBox('users_address');

    String? token = await _getToken();
    List<dynamic>? addresses = await box.get(token);
    if (addresses != null) {
      List<Map<dynamic, dynamic>> convertedAddresses =
          addresses.cast<Map<dynamic, dynamic>>().toList();
      setState(() {
        controllerList[0].text =
            convertedAddresses[addressindex]['address'] ?? '';
        controllerList[1].text = convertedAddresses[addressindex]['unit'] ?? '';
        controllerList[2].text = convertedAddresses[addressindex]['city'] ?? '';
        controllerList[3].text =
            convertedAddresses[addressindex]['state'] ?? '';
        controllerList[4].text =
            convertedAddresses[addressindex]['zipcode'] ?? '';
        controllerList[5].text =
            convertedAddresses[addressindex]['instruction'] ?? '';
      });
    } else {
      return null;
    }
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber');
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

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var data = ModalRoute.of(context)!.settings.arguments;
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
        title: appBarTitle('Edit Address', 20.sp, AppColors.green),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(children: [
              20.verticalSpace,
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
                  textInputType: TextInputType.text,
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
                  textInputType: TextInputType.text,
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
                  keyboardType: TextInputType.text,
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
                  text: 'Update',
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
                        editAddress();
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
