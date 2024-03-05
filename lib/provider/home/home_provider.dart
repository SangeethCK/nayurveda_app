
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nayurveda_app/application/home/home_notifier.dart';
import 'package:nayurveda_app/application/home/home_state.dart';

class HomeProvider {
  HomeProvider._();

  static final homeProvider =
      StateNotifierProvider<HomeNotifier, HomeState>((ref) {
    return HomeNotifier();
  });
}
