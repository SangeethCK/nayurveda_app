
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nayurveda_app/core/constant/color.dart';
import 'package:nayurveda_app/core/routes/route_generator.dart';
import 'package:nayurveda_app/core/routes/routes.dart';
import 'package:nayurveda_app/presentation/screens/splash/screen_splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
class MyApp extends StatelessWidget {
 const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Ayurveda',
          initialRoute: initialRoutes,
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) {
            return RouteGenerator.generateRoue(settings);
          },
          theme: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: primaryColor,
              ),
              textTheme: GoogleFonts.poppinsTextTheme(),
              primaryColor: primaryColor,
              scaffoldBackgroundColor: const Color(0xffF8F7FC)),
          home: const ScreenSplash(),
        );
      }),
    );
  }
}
