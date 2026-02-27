import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:girl_clan/UI/auth/login/login_view_model.dart';
import 'package:girl_clan/UI/auth/sign_up/sign_up.dart';
import 'package:girl_clan/UI/root_screen/root_screen.dart';
import 'package:girl_clan/core/constants/auth_text_feild.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/core/constants/text_style.dart';
import 'package:girl_clan/custom_widget/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              ///. login screen UI here
              ///
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        60.verticalSpace,
                        Text(
                          'Login Screen',
                          style: style16B.copyWith(color: blackColor),
                        ),
                        20.verticalSpace,

                        Text(
                          'Email',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (val) {
                            model.appUser.email = val;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Email',
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'Password',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (val) {
                            model.appUser.password = val;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Password',
                          ),
                        ),
                        20.verticalSpace,

                        50.verticalSpace,
                        Center(
                          child: CustomButton(
                            onTap: () {
                              model.login();
                            },
                            text: 'Login',
                            backgroundColor: secondaryColor,
                          ),
                        ),
                        20.verticalSpace,
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: style14B.copyWith(color: blackColor),
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.to(SignUpScreen());
                                },
                                child: Text(
                                  'SignUp',
                                  style: style14B.copyWith(color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
