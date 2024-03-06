import 'package:flutter/material.dart';
import 'package:nayurveda_app/core/routes/routes.dart';
import 'package:nayurveda_app/presentation/screens/auth/screen_login.dart';
import 'package:nayurveda_app/presentation/screens/home/screen_home.dart';
import 'package:nayurveda_app/presentation/screens/register/screen_register.dart';
import 'package:nayurveda_app/presentation/screens/splash/screen_splash.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoue(RouteSettings routeSettings) {
    final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoutes:
        return MaterialPageRoute(builder: (_) => const ScreenSplash());
      case login:
        return MaterialPageRoute(builder: (_) => const ScreenLogin());
      case home:
        return MaterialPageRoute(builder: (_) => const ScreenHome());
      case register:
        return MaterialPageRoute(builder: (_) => const ScreenRegister());

      default:
        throw _errorRoute(error: 'error');
    }
  }

  static Route<dynamic> _errorRoute({String? error, bool argsError = false}) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        // appBar: AppbarWidget(
        //   title: 'Error',
        // ),
        body: Center(
          child: Text(
            error ?? '${argsError ? 'Arguments' : 'Navitation'} Error',
            style: TextUtils.theme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
