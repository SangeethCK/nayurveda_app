import 'package:flutter/material.dart';

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
      style: const TextStyle(
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
