import 'package:get/route_manager.dart';
import 'package:girl_clan/UI/home/home_screen.dart';
import 'package:girl_clan/UI/root_screen/root_screen.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:girl_clan/core/model/app_user.dart';
import 'package:girl_clan/core/others/base_view_model.dart';
import 'package:girl_clan/core/services/auth_services.dart';
import 'package:girl_clan/core/services/data_base_services.dart';

class LoginViewModel extends BaseViewModel {
  AuthServices authServices = AuthServices();
  DataBaseServices db = DataBaseServices();
  AppUser appUser = AppUser();
  login() async {
    if ((appUser.email ?? '').isEmpty || (appUser.password ?? '').isEmpty) {
      Get.snackbar('Error', 'Email and password required');
      return;
    } else {
      setState(ViewState.busy);
      try {
        final result = await authServices.login(appUser);
        if (result != null) {
          Get.snackbar('Success', 'Login Successfully');

          Get.offAll(RootScreen());
        }
      } catch (e) {
        Get.snackbar('error', "Error $e");
      } finally {
        setState(ViewState.idle);
      }
    }
  }
}
