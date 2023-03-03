import 'package:flutter/material.dart';
import 'package:gdsc_kareemkhalil/component/color.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  final bool? isPassword;
  final Function()? onTap;
  final double? height;
  final double? width;

  const CustomTextFormFeild({
    Key? key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.keyboardType,
    required this.validator,
    this.suffixIcon,
    required this.obscureText,
    this.isPassword,
    this.onTap,
    this.height,
    this.width,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? MediaQuery.of(context).size.width * 0.8 : width,
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            color: AppColors.lightBlack.withOpacity(0.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkBlack,
            ),
          ),
          focusColor: AppColors.button,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              labelText!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          //InkWell(onTap: onTap, child: suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
