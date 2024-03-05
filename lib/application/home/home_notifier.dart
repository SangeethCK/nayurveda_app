import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/home/home_state.dart';
import 'package:nayurveda_app/infrastructure/home/home_respository.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());
  Future<void> loadPatientsLists() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await HomeRepositories().home();
      if (response.isNotEmpty) {
        state = state.copyWith(patientList: response);

        
      }
    } catch (e) {
      log("$e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
