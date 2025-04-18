import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimayButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final Color? textColor;
  final double? fontSize;
  final void Function()? onPress;
  const PrimayButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.bordersRadius,
    this.fontSize,
    this.textColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Color(0xff827979),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordersRadius ?? 100.r),
          ),
          fixedSize: Size(width ?? 500.w, height ?? 56.h),
        ),
        child: Text(
          buttonText ?? "",
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? 16.sp,
          ),
        ),
      ),
    );
  }
}
