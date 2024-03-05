
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../text/text_utils.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    this.title,
    this.logo = false,
    this.centerTitle = false,
    this.actions = const [],
    this.color,
    this.iconColor,
    this.actionTitle,
    this.shadow = false,
    this.hideLeading = false,
  });

  final String? title, actionTitle;
  final bool logo, shadow, centerTitle;
  final List<Widget> actions;
  final Color? color, iconColor;
  final bool hideLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(
          color: iconColor,
          size: 20,
        ),
        backgroundColor: color,
        elevation: shadow ? null : 0,
        leadingWidth: logo ? 22.w : null,
        shape: Border(
            bottom: BorderSide(
                color: shadow ? kBlack54 : kTransparentColor, width: 0.25)),
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
        ),
        titleSpacing: Navigator.canPop(context) == true ? 0 : null,
        title: title != null
            ? Text(
                title!,
                style: TextUtils.theme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade200,
                ),
              )
            : null,
        centerTitle: centerTitle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset('assets/images/clarity_bell-line.svg'),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
