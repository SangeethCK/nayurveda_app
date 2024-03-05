
import 'package:flutter/material.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomMaterialBtton extends StatelessWidget {
  const CustomMaterialBtton({
    required this.onPressed,
    this.buttonText = 'Submit',
    this.textStyle,
    this.child,
    this.leading,
    this.height = 45,
    this.fontSize,
    this.textColor,
    this.color,
    this.minWidth = double.infinity,
    this.padding,
    super.key,
    this.fontWeight = FontWeight.w500,
    this.borderRadius = 12,
    this.borderColor,
    this.elevation = 0,
    this.margin,
    this.loadingColor = Colors.white,
    this.isLoading = false,
    this.shrinkWrap = false,
  });
  final Widget? child;
  final String buttonText;
  final Widget? leading;
  final double? fontSize;
  final Color? textColor;
  final Color? color;
  final double? minWidth;
  final double height;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsets? margin;
  final bool isLoading;
  final Color? loadingColor;

  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: MaterialButton(
        materialTapTargetSize: shrinkWrap
            ? MaterialTapTargetSize.shrinkWrap
            : MaterialTapTargetSize.padded,
        height: height,
        minWidth: minWidth,
        onPressed: !isLoading ? onPressed : () {},
        color: color ?? primaryColor,
        splashColor: borderColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            side: BorderSide(color: borderColor ?? primaryColor)),
        child: SizedBox(
          height: height,
          child: isLoading
              ? Center(
                  child: SizedBox(
                    height: height / 2,
                    width: height / 2,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.75,
                      color: loadingColor,
                    ),
                  ),
                )
              : child ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) kWidth5,
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            buttonText,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle ??
                                TextUtils.theme.labelLarge?.copyWith(
                                  color: textColor ?? kWhite,
                                  fontSize: fontSize ?? 16.sp,
                                  fontWeight: fontWeight,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
