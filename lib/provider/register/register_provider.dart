
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/register/register_notifier.dart';
import 'package:nayurveda_app/application/register/register_state.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';

class RegisterProvider {
  RegisterProvider._();

  static final formKey = Provider.autoDispose<GlobalKey<FormState>>((ref) {
    return GlobalKey<FormState>();
  });

  static final name = Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

  static final whatsApp = Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });
  static final address = Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

  static final location = Provider.autoDispose<DropDownValue>((ref) {
    return DropDownValue();
  });
  static final branchList = Provider.autoDispose<DropDownValue>((ref) {
    return DropDownValue();
  });
  static final totalAmount = Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });
  static final disocuntAmount =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });
  static final advanceAmount =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });
  static final balanceAmount =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });
  static final branch =
      StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
    return RegisterNotifier()..loadBranch();
  });

  static final addData =
      StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
    return RegisterNotifier();
  });

  static final maleAdd =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

  static final femaleAdd =
      Provider.autoDispose<TextEditingController>((ref) {
    return TextEditingController();
  });

 static final addTreatment =
      StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
    return RegisterNotifier()..addTreatment();
  });
static final loadTreatment =
      StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
    return RegisterNotifier()..loadTreatment();
  });


}
