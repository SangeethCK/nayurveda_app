import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/presentation/widgets/buttons/custom_material_button.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/common_dropdown.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';
import 'package:nayurveda_app/provider/register/register_provider.dart';

dialogBuilder(
  BuildContext context, {
  required Function miniFunction,
  required Function addFunction,
  required Function femalMini,
  required Function femalAdd,
  List<DropDownValue>? treatmentList,
  DropDownValue? selectedDropdown,
  required Function onChanged,
  required Function save,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          ref.watch(RegisterProvider.addData);
          ref.watch(RegisterProvider.loadTreatment);

          return AlertDialog(
            title: const Text('Choose Treatment'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonDropdown(
                    hintText: 'Choose prefered treatment',
                    dropDownValue: ref
                            .read(RegisterProvider.loadTreatment)
                            .treatmentData ??
                        [],
                    onChanged: (v) {
                      onChanged(v);
                    }),
                kHeight15,
                const Text('Add Patients'),
                kHeight10,
                rowWidget(
                    addFuncton: () {
                      addFunction();
                    },
                    miniFunction: () {
                      miniFunction();
                    },
                    title: 'Male',
                    value: ref.watch(RegisterProvider.addData).maleCount),
                kHeight10,
                rowWidget(
                    addFuncton: () {
                      femalAdd();
                    },
                    miniFunction: () {
                      femalMini();
                    },
                    title: 'Female',
                    value: ref.watch(RegisterProvider.addData).femaleCount),
              ],
            ),
            actions: <Widget>[
              CustomMaterialBtton(
                borderColor: Colors.transparent,
                buttonText: 'Save',
                textColor: kWhite,
                onPressed: () {
                  save();
                },
              ),
            ],
          );
        },
      );
    },
  );
}

Widget rowWidget({
  required Function miniFunction,
  required Function addFuncton,
  int? value,
  String? title,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 50,
        width: 110,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.25)),
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(217, 217, 217, 0.25)),
        child: Center(child: Text(title ?? '')),
      ),
      kWidth10,
      InkWell(
        onTap: () {
          miniFunction();
        },
        child: const CircleAvatar(
          child: Icon(Icons.remove),
        ),
      ),
      kWidth10,
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.25)),
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(217, 217, 217, 0.25)),
        child: Center(child: Text(value.toString())),
      ),
      kWidth10,
      InkWell(
        onTap: () {
          addFuncton();
        },
        child: const CircleAvatar(
          child: Icon(Icons.add),
        ),
      ),
    ],
  );
}
