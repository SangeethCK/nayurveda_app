
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget({
    super.key,
    this.labelText,
    this.topLabelText,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.isHint = false,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.textDirection,
    this.maxLines,
    this.maxLength,
    this.couterText,
    this.hideCounterText = false,
    this.controller,
    this.inputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.5)),
      borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 0.89),
    ),
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.autovalidateMode,
    this.validator,
    this.errorStyle = true,
    this.errorText,
    this.focusNode,
    this.enabled,
    this.isDense = true,
    this.contentPadding = const EdgeInsets.all(14),
    this.constraints,
    this.readOnly,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.obscureText,
    this.floatingLabelBehavior,
    this.fillColor = const Color.fromRGBO(217, 217, 217, 0.25),
    this.errorColor = Colors.brown,
    this.fontSize,
    this.hintSize,
    this.textAlign = TextAlign.start,
    this.fontColor,
    this.isRequired = false,
  });
  final String? labelText;
  final String? topLabelText;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool isHint;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final int? maxLines, maxLength;
  final String? couterText;
  final bool hideCounterText;
  final InputBorder? inputBorder;
  final Color? borderColor;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator? validator;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool? readOnly;
  final bool? isDense;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final BoxConstraints? constraints;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final bool? obscureText;
  final bool errorStyle;
  final String? errorText;
  final Color? fontColor, fillColor, errorColor;
  final double? fontSize, hintSize;
  final TextAlign textAlign;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabelText != null)
          Column(
            children: [
              Text.rich(
                TextSpan(text: topLabelText!, children: [
                  TextSpan(
                      text: isRequired ? ' *' : '',
                      style: const TextStyle(color: Colors.red))
                ]),
                style: TextUtils.theme.labelLarge?.copyWith(
                    color: const Color(0xff404040),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              kHeight8,
            ],
          ),
        TextFormField(
          controller: controller,
          style: textStyle ??
              TextUtils.theme.labelLarge?.copyWith(
                color: fontColor,
                fontSize: fontSize ?? 15.sp,
                fontWeight: FontWeight.w400,
              ),
          textAlign: textAlign,
          decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior,
            counterText: hideCounterText ? '' : couterText,
            labelText: isHint ? null : labelText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: inputBorder?.copyWith(
                borderSide: const BorderSide(color: Colors.grey)),
            // disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedErrorBorder: inputBorder,
            errorBorder: inputBorder?.copyWith(
                borderSide: const BorderSide(color: Colors.white70)),
            labelStyle: const TextStyle(color: Colors.grey),
            fillColor: fillColor,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            hintText: isHint ? labelText : hintText,
            hintStyle: hintStyle ??
                TextStyle(fontSize: hintSize ?? 15.sp, color: kColorHint),
            isDense: isDense,
            errorText: errorText,
            errorStyle: errorStyle
                ? TextStyle(color: errorColor, fontSize: 14.sp, height: 1)
                : const TextStyle(fontSize: 0.01),
            constraints: constraints,
            contentPadding: contentPadding,
          ),
          keyboardType: textInputType ?? TextInputType.text,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          textDirection: textDirection ?? TextDirection.ltr,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          validator: validator,
          focusNode: focusNode,
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          onSaved: onSaved,
          onChanged: onChanged,
          onTap: onTap,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
