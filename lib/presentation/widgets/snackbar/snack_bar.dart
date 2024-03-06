import 'package:flutter/material.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';

SnackBar snackBarWidget(
  String content, {
  Color? color,
  Duration? duration,
  SnackBarAction? action,
}) {
  return SnackBar(
    duration: duration ?? const Duration(seconds: 2),
    content: Text(
      content,
      style: TextUtils.theme.titleSmall?.copyWith(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: color ?? Colors.red,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
    action: action,
  );
}
