import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nayurveda_app/core/constant/sizes.dart';
import 'package:nayurveda_app/presentation/widgets/buttons/custom_material_button.dart';
import 'package:nayurveda_app/presentation/widgets/padding/main_padding.dart';
import 'package:nayurveda_app/presentation/widgets/text/text_utils.dart';
import 'package:nayurveda_app/presentation/widgets/text_fields/text_field_widget.dart';
import 'package:nayurveda_app/provider/sign-in/sign_in_provider.dart';

class ScreenLogin extends ConsumerWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .28,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/log.png')),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/Asset 1 2.svg',
                    height: 84,
                    width: 80,
                  ),
                ),
              ),
              MainPadding(
                top: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login or register to book your appointments',
                      style: TextUtils.theme.titleSmall?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    kHeight30,
                    TextFeildWidget(
                      hintText: 'Enter your email',
                      controller: ref.watch(SignInProvider.usernameController),
                    ),
                    kHeight25,
                    TextFeildWidget(
                      hintText: 'Enter your password',
                      controller: ref.watch(SignInProvider.pasdController),
                    ),
                    kHeight20,
                    Consumer(builder: (context, ref, child) {
                      final authNotifier =
                          ref.read(SignInProvider.signInProvider.notifier);

                      return CustomMaterialBtton(
                        onPressed: () async {
                          authNotifier.login(
                            context: context,
                            userName: ref
                                .watch(SignInProvider.usernameController)
                                .text,
                            password: int.parse(
                                ref.watch(SignInProvider.pasdController).text),
                          );
                        },
                      );
                    }),
                    kHeight35,
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[200],
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text:
                                  'By creating or logging into an account you are agreeing with our  and Privacy Policy.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ])),
                    ),
                  ],
                ),
              ),
              kHeight10
            ],
          ),
        ));
  }
}
