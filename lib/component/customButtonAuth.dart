import 'package:flutter/material.dart';
import 'package:gdsc_kareemkhalil/component/color.dart';

class CustomButtonAuth extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? radius;
  final double? elevation;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomButtonAuth(
      {Key? key,
      this.text,
      this.onPressed,
      this.color,
      this.textColor,
      this.width,
      this.height,
      this.fontSize,
      this.radius,
      this.elevation,
      this.textAlign,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius != null
            ? BorderRadius.circular(radius!)
            : BorderRadius.circular(10),
        color: color == null ? AppColors.button : color,
      ),
      height: height,
      width: width,
      child: MaterialButton(
        elevation: elevation,
        padding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          textAlign: textAlign ?? TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontFamily: "fontFamily",
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
