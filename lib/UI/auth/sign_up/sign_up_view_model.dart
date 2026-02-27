import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:girl_clan/UI/auth/login/login.dart';
import 'package:girl_clan/UI/root_screen/root_screen.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:girl_clan/core/model/app_user.dart';
import 'package:girl_clan/core/others/base_view_model.dart';
import 'package:girl_clan/core/services/auth_services.dart';
import 'package:girl_clan/core/services/data_base_services.dart';
import 'package:provider/provider.dart';

class SignUpViewModel extends BaseViewModel {
  AuthServices authServices = AuthServices();
  DataBaseServices dataBaseServices = DataBaseServices();
  AppUser appUser = AppUser();
  register() async {
    if ((appUser.email ?? '').isEmpty ||
        (appUser.name ?? '').isEmpty ||
        (appUser.password ?? '').isEmpty ||
        (appUser.Bio ?? '').isEmpty ||
        (appUser.DOB ?? '').isEmpty) {
      Get.snackbar(
        'Error',
        'Error while registering your account please fill all the fields',
        colorText: blackColor,
      );
    } else {
      setState(ViewState.busy);
      try {
        final result = await authServices.register(appUser);
        if (result != null) {
          appUser.id = result.user?.uid;
          print(result);
          print(appUser.name);
          print(appUser.email);

          Get.snackbar(
            'Success',
            'Your Account is register successfully',
            colorText: blackColor,
            backgroundColor: primaryColor,
            borderColor: primaryColor,
          );
          dataBaseServices.setUserData(appUser);
// should i used mounted here or not 

          Get.to(RootScreen());
        }
        print(result);
      } catch (e) {
        print('Error while registering your account $e');
        Get.snackbar('Error', 'Error while registering your account $e');
      } finally {
        setState(ViewState.idle);
      }
    }
  }

  ///
  ///  upload User Data
  ///

  // sendUserDataToDataBase() async {
  //   final ref = await dataBaseServices.setUserData(appUser);
  //   try{
  //     if(ref!=null || ref.id.isNotEmpty){
  //       print('User data uploaded successfully');
  //       Get.offAll(SplashScreen());
  //     }
  //   }catch(e){
  //     print('Error while uploading user data $e');
  //   }
  // }
  @override
  void dispose() {
    super.dispose();
  }
}
