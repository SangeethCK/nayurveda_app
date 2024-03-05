import 'package:flutter/material.dart';

Widget radioSelectWidget(bool select, {double? width, double? borderWidth}) {
  return Container(
    width: width ?? 21,
    height: width ?? 21,
    decoration: BoxDecoration(
        color: select ? Colors.white : const Color(0xffF3EFFF),
        shape: BoxShape.circle,
        border: Border.all(
          color: select ? Colors.grey.shade300 : Colors.white,
          // width: select ? borderWidth ?? 5.2 : 0,
        )),
  );
}

Widget radioSelectRow(
    {required bool selected,
    required String text,
    required Function onTap,
    double? width,
    double? border}) {
  return TextButton(
    onPressed: () {
      onTap();
    },
    child: Row(
      children: [
        radioSelectWidget(selected, width: width, borderWidth: border),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}
