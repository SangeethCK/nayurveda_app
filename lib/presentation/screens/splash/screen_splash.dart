import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nayurveda_app/core/routes/routes.dart';
import 'package:nayurveda_app/provider/sign-in/sign_in_provider.dart';

class ScreenSplash extends ConsumerWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'assets/images/logo_make_11_06_2023_115 1.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.65),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/Asset 1 2.svg'),
            Center(
              child: FutureBuilder<void>(
                future: Future.delayed(const Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final auth =
                        ref.read(SignInProvider.signInProvider.notifier);
                    auth.loadToken().then((token) {
                      if (token != null && token.isNotEmpty) {
                        Navigator.pushReplacementNamed(context, home);
                      } else {
                        Navigator.pushReplacementNamed(context, login);
                      }
                    });
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
