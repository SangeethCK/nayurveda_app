import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/register/register_state.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/domain/models/rgeister/register_request.dart';
import 'package:nayurveda_app/infrastructure/register/resgister_repository.dart';
import 'package:nayurveda_app/main.dart';
import 'package:nayurveda_app/presentation/widgets/dropdown/models/drop_down.dart';

import '../../core/constant/demo.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState(addTreatment: []));
  Future<void> loadBranch() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await RegisterRepository().branch();
      if (response.isNotEmpty) {
        state = state.copyWith(branchList: response);
        state.branchData = response
            .map((e) => DropDownValue(id: e.id, value: e.name))
            .toList();
      }
    } catch (e) {
      log("$e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //=-=-=-= Add Register =-=-=-=-=

  Future<void> addRegister({RegisterRequest? datRequest,required BuildContext context}) async {
    try {
      state = state.copyWith(isLoading: true);
      final response =
          await RegisterRepository().addRegister(dataRequest: datRequest);
      if (response == true) {
        log('Successfully Added');
        rootScaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content: Text(
            'Successfully Registered!',
            style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
        ));
        // Navigator.pop(context);
      }
    } catch (e) {
      log("$e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //=-=-=-=- Treatment =-=-=-=
  void addTreatment({String? value, String? male, String? female}) {
    final newTreatment = AddTreatment(value: value, male: male, female: female);
    final treatments = state.addTreatment ?? [];

    bool hasDuplicate = false;
    for (final treatment in treatments) {
      if (treatment.value == value &&
          treatment.male == male &&
          treatment.female == female) {
        hasDuplicate = true;
        break;
      }
    }

    if (!hasDuplicate) {
      state = state.copyWith(addTreatment: [...treatments, newTreatment]);
    }
  }

  void increment(int value) {
    if (value != 0) {
      state = state.copyWith(maleCount: state.maleCount + 1);
    } else {
      state = state.copyWith(femaleCount: state.femaleCount + 1);
    }
    log("Count === ${state.maleCount}");
  }

  decrement(int value) {
    if (value != 0) {
      state = state.copyWith(maleCount: state.maleCount - 1);
    } else {
      state = state.copyWith(femaleCount: state.femaleCount - 1);
    }
  }

  Future<void> loadTreatment() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await RegisterRepository().treatmetLists();
      if (response.isNotEmpty) {
        state = state.copyWith(treamnetList: response);
        state.treatmentData = response
            .map((e) => DropDownValue(id: e.id, value: e.name))
            .toList();
      }
    } catch (e) {
      log("$e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  changeTreatment(value) {
    state = state.copyWith(
        selectedTreatment: value, treatmentData: state.treatmentData);
    log("${state.selectedTreatment?.id}");
  }

  changeBranch(value) {
    state = state.copyWith(
        selectedBranch: value, treatmentData: state.treatmentData);
    log("HELLOPPP ${state.selectedBranch?.id}");
  }
}
