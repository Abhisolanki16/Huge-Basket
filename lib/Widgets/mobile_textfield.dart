import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_textfield.dart';

// ignore: must_be_immutable
class MobileTextField extends StatelessWidget {
  MobileTextField(
      {super.key, required this.controller, required this.validator,this.focusNode,this.onFieldSubmitted});

  TextEditingController controller = TextEditingController();
dynamic Function(String)? onFieldSubmitted;
  FocusNode? focusNode;

  FormFieldValidator validator;
  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller,
      textInputType: TextInputType.phone,
      focusNode: focusNode,
      hintText: 'Phone Number',
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      prefixIcon: SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CountryCodePicker(
              initialSelection: 'IN',
              favorite: ['+91', 'IN'],
              showFlag: false,
              showFlagDialog: true,
            ),
            Container(
              height: 30.h,
              width: 1.w,
              color: const Color(0xFF999B9C),
            ),
            5.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
