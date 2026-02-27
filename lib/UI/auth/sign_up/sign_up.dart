import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:girl_clan/UI/auth/login/login.dart';
import 'package:girl_clan/UI/auth/sign_up/sign_up_view_model.dart';
import 'package:girl_clan/UI/auth/splash_screen.dart';
import 'package:girl_clan/UI/root_screen/root_screen.dart';
import 'package:girl_clan/core/constants/auth_text_feild.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/core/constants/text_style.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:girl_clan/custom_widget/custom_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
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
                          'SignUp Screen',
                          style: style16B.copyWith(color: blackColor),
                        ),
                        20.verticalSpace,
                        Text(
                          'Name',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (value) {
                            model.appUser.name = value;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Name',
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'Email',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (value) {
                            model.appUser.email = value;
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
                          onChanged: (value) {
                            model.appUser.password = value;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Password',
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'date of birth',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (value) {
                            model.appUser.DOB = value;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Date of Birth',
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'Bio',
                          style: style14B.copyWith(color: blackColor),
                        ),
                        10.verticalSpace,
                        TextFormField(
                          onChanged: (value) {
                            model.appUser.Bio = value;
                          },
                          decoration: EditProfileFieldDecoration.copyWith(
                            hintText: 'Bio',
                          ),
                        ),
                        50.verticalSpace,
                        // model.state == ViewState.busy
                        //     ?
                        // Center(child: CircularProgressIndicator())
                        CustomButton(
                          onTap: () {
                            model.register();
                          },
                          text: "SignUp",
                          backgroundColor: primaryColor,
                        ),
                        20.verticalSpace,
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: style14B.copyWith(color: blackColor),
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.to(RootScreen());
                                },
                                child: Text(
                                  'Login',
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
