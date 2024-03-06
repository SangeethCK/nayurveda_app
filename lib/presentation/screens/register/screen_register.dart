// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/constant/demo.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/domain/models/rgeister/register_request.dart';
import 'package:nayurveda_app/main.dart';
import 'package:nayurveda_app/presentation/screens/register/widgets/pdf_generate.dart';
import 'package:nayurveda_app/presentation/widgets/appbar/appbar.dart';
import 'package:nayurveda_app/presentation/widgets/buttons/custom_material_button.dart';
import 'package:nayurveda_app/presentation/widgets/buttons/radio_button.dart';
import 'package:nayurveda_app/presentation/widgets/date_picker/date_picker.dart';
import 'package:nayurveda_app/presentation/widgets/dialog/alert_dialog.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/common_dropdown.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';
import 'package:nayurveda_app/presentation/widgets/padding/main_padding.dart';
import 'package:nayurveda_app/presentation/widgets/snackbar/snack_bar.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';
import 'package:nayurveda_app/presentation/widgets/text_fields/text_field_widget.dart';
import 'package:nayurveda_app/provider/register/register_provider.dart';

import 'widgets/treatment_list_widget.dart';

class ScreenRegister extends ConsumerWidget {
  const ScreenRegister({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: const AppbarWidget(),
      body: ListView(
        children: [
          MainPadding(
            child: Text(
              'Register',
              style: TextUtils.theme.titleSmall?.copyWith(
                  color: kBlack54, fontWeight: FontWeight.w600, fontSize: 24),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          MainPadding(
              child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFeildWidget(
                  topLabelText: 'Name',
                  labelText: 'Enter your name',
                  controller: ref.watch(RegisterProvider.name),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                kHeight10,
                TextFeildWidget(
                  topLabelText: 'Whatsapp Number',
                  labelText: 'Enter your Whatsapp Number',
                  controller: ref.watch(RegisterProvider.whatsApp),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                kHeight10,
                TextFeildWidget(
                  topLabelText: 'Address',
                  labelText: 'Enter your full Address',
                  controller: ref.watch(RegisterProvider.address),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                kHeight10,
                const Text('Locations'),
                kHeight10,
                Consumer(
                  builder: (context, ref, child) {
                    return CommonDropdown(
                        isColor: true,
                        hintText: '',
                        dropDownValue: CommonFunction().listOfDistrict,
                        onChanged: (v) {
                          ref
                              .watch(RegisterProvider.addData.notifier)
                              .changeBranch(v);
                        });
                  },
                ),
                const Text('Branch'),
                kHeight10,
                Consumer(
                  builder: (context, ref, child) {
                    ref.watch(RegisterProvider.branch);
                    return CommonDropdown(
                        isColor: true,
                        hintText: '',
                        dropDownValue:
                            ref.watch(RegisterProvider.branch).branchData ?? [],
                        onChanged: (v) {
                          ref
                              .watch(RegisterProvider.addData.notifier)
                              .changeBranch(v);
                        });
                  },
                ),
                kHeight10,
                Consumer(builder: (context, ref, child) {
                  final registerState = ref.watch(RegisterProvider.addData);
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: registerState.addTreatment?.length ?? 0,
                      itemBuilder: (context, i) {
                        final list = registerState.addTreatment?[i];
                        return TreatMentListWidget(
                          name: list?.value,
                          maleCount: list?.male,
                          femaleCoun: list?.female,
                          remove: () {
                            log('message');
                            ref
                                .read(RegisterProvider.addData.notifier)
                                .removeTreatment(i);
                          },
                          edit: () {
                            ref
                                .read(RegisterProvider.addData.notifier)
                                .editTreatment(list!);
                          },
                        );
                      });
                }),
                kHeight15,
                Consumer(
                  builder: (context, ref, child) {
                    final data = ref.read(RegisterProvider.addData.notifier);

                    ref.watch(RegisterProvider.loadTreatment);
                    return CustomMaterialBtton(
                      borderColor: Colors.transparent,
                      color: const Color.fromRGBO(56, 154, 72, 0.3),
                      buttonText: '+ Add Treatments',
                      textColor: Colors.black87,
                      onPressed: () {
                        ref
                            .read(RegisterProvider.addData.notifier)
                            .resetCounts();
                        dialogBuilder(context,
                            save: () {
                              ref
                                  .watch(RegisterProvider.addData.notifier)
                                  .addTreatment(
                                      value:
                                          ref
                                              .watch(RegisterProvider.addData)
                                              .selectedTreatment
                                              ?.value,
                                      female: ref
                                          .read(RegisterProvider.addData)
                                          .maleCount
                                          .toString(),
                                      male: ref
                                          .read(RegisterProvider.addData)
                                          .femaleCount
                                          .toString());
                              Navigator.pop(context);
                            },
                            selectedDropdown: DropDownValue(),
                            treatmentList: ref
                                .read(RegisterProvider.addData)
                                .treatmentData,
                            miniFunction: () {
                              ref.watch(RegisterProvider.addData);
                              data.decrement(1);
                            },
                            addFunction: () {
                              data.increment(1);
                            },
                            onChanged: (v) {
                              ref
                                  .watch(RegisterProvider.addData.notifier)
                                  .changeTreatment(v);

                              log("Hello ~~~ ${ref.watch(RegisterProvider.addData).selectedTreatment}");
                            },
                            femalAdd: () {
                              data.increment(0);
                            },
                            femalMini: () {
                              data.decrement(0);
                            });
                      },
                    );
                  },
                ),
                TextFeildWidget(
                  topLabelText: 'Total Amount',
                  labelText: '',
                  controller: ref.watch(RegisterProvider.totalAmount),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                kHeight10,
                TextFeildWidget(
                  topLabelText: 'Discount Amount',
                  labelText: '',
                  controller: ref.watch(RegisterProvider.disocuntAmount),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                const Text('Payment Option'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    radioSelectRow(selected: true, text: 'Cash', onTap: () {}),
                    radioSelectRow(selected: true, text: 'Card', onTap: () {}),
                    radioSelectRow(selected: true, text: 'UPI', onTap: () {})
                  ],
                ),
                TextFeildWidget(
                  topLabelText: 'Advance Amount',
                  labelText: '',
                  controller: ref.watch(RegisterProvider.advanceAmount),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                TextFeildWidget(
                  topLabelText: 'Balance Amount',
                  labelText: '',
                  controller: ref.watch(RegisterProvider.balanceAmount),
                  validator: (value) {
                    return CommonFunction().validateIsEmpty(value);
                  },
                ),
                kHeight10,
                const Text('Payment Option'),
                kHeight10,
                DatePickerContainer(
                  hintText: '',
                  changeDate: (DateTime date) {},
                  value: apiFormat.format(DateTime.now()),
                ),
                kHeight10,
                const Text(
                  'Treatment Time',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 4,
                        child: CommonDropdown(
                            hintText: 'Hour',
                            dropDownValue: CommonFunction().hour,
                            onChanged: () {})),
                    kWidth10,
                    Flexible(
                        flex: 4,
                        child: CommonDropdown(
                            hintText: '',
                            dropDownValue: CommonFunction().mini,
                            onChanged: () {}))
                  ],
                ),
                kHeight14,
                Consumer(
                  builder: (context, ref, child) {
                    final data = ref.read(RegisterProvider.addData.notifier);
                    return CustomMaterialBtton(
                      borderColor: Colors.transparent,
                      color: primaryColor,
                      buttonText: 'Save',
                      textColor: Colors.white,
                      onPressed: () {
                        log("Name ===> ${ref.watch(RegisterProvider.branch).selectedTreatment?.id}");
                        RegisterRequest registerRequest = RegisterRequest(
                            name: ref.watch(RegisterProvider.name).text,
                            // excecutive:
                            //     ref.read(RegisterProvider.name).text,
                            payment: 'ss',
                            address: ref.watch(RegisterProvider.address).text,
                            phone: ref.watch(RegisterProvider.whatsApp).text,
                            advanceAmount: int.parse(ref
                                    .watch(RegisterProvider.advanceAmount)
                                    .text ??
                                '0.0'),
                            balanceAmount: int.parse(
                                ref.watch(RegisterProvider.balanceAmount).text),
                            female: ref
                                .read(RegisterProvider.addData)
                                .femaleCount
                                .toString(),
                            male: ref
                                .read(RegisterProvider.addData)
                                .maleCount
                                .toString(),
                            branch: ref
                                .watch(RegisterProvider.addData)
                                .selectedBranch
                                ?.id,
                            totalAmount: int.tryParse(
                              ref.watch(RegisterProvider.totalAmount).text,
                            ),
                            treatments: ref
                                .watch(RegisterProvider.addData)
                                .selectedTreatment
                                ?.id,
                            dateNdTime: 'dd',
                            discountAmount: int.parse(ref
                                .watch(RegisterProvider.disocuntAmount)
                                .text));
                        // final formKey = ref.read(RegisterProvider.formKey);
                        if (formKey.currentState?.validate() ?? false) {
                          log('message');
                          data.addRegister(
                              context: context, datRequest: registerRequest);
                          generatePDF(registerRequest);
                        } else {
                          rootScaffoldMessengerKey.currentState?.showSnackBar(
                              snackBarWidget('Please fill the form!'));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
