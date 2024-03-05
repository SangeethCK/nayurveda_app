import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextUtils {
  static TextTheme get theme {
    final TextTheme textTheme = ThemeData.light().textTheme;

    return TextTheme(
      displayLarge: textTheme.displayLarge?.copyWith(),
      displayMedium: textTheme.displayMedium?.copyWith(),
      displaySmall: textTheme.displaySmall?.copyWith(),
      headlineLarge: textTheme.headlineLarge?.copyWith(fontSize: 26.sp),
      headlineMedium: textTheme.headlineMedium?.copyWith(fontSize: 24.sp),
      headlineSmall: textTheme.headlineSmall?.copyWith(fontSize: 20.sp),
      titleLarge: textTheme.titleLarge?.copyWith(fontSize: 18.sp),
      titleMedium: textTheme.titleMedium
          ?.copyWith(fontSize: 16.5.sp, fontWeight: FontWeight.w500),
      titleSmall: textTheme.titleSmall?.copyWith(fontSize: 15.sp),
      bodyLarge: textTheme.bodyLarge?.copyWith(fontSize: 16.sp),
      bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
      bodySmall: textTheme.bodySmall?.copyWith(fontSize: 13.sp),
      labelLarge: textTheme.labelLarge?.copyWith(fontSize: 15.sp),
      labelMedium: textTheme.labelMedium?.copyWith(fontSize: 14.sp),
      labelSmall: textTheme.labelSmall?.copyWith(fontSize: 12.sp),
    );
  }
}
