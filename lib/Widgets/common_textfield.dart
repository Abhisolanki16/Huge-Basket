import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.focusNode,
      this.prefixIcon,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.textInputAction,
      this.textInputType});

  TextEditingController controller = TextEditingController();
  TextInputType? textInputType;
  String hintText;
  FocusNode? focusNode;
  Icon? suffixIcon;
  

  FormFieldValidator validator;
  Widget? prefixIcon;
  TextInputAction? textInputAction;
  Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      focusNode: focusNode,
      
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 15.w),
        hintText: hintText,
        fillColor: const Color(0xFFF3F4F6),
        filled: true,
        hintStyle: const TextStyle(color: Color(0xFF999B9C)),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
