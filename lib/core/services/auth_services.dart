import 'package:firebase_auth/firebase_auth.dart';
import 'package:girl_clan/core/model/app_user.dart';
import 'package:girl_clan/core/others/base_view_model.dart';
import 'package:girl_clan/core/services/data_base_services.dart';

class AuthServices extends BaseViewModel {
  DataBaseServices dataBaseServices = DataBaseServices();
  // sign up
  FirebaseAuth auth = FirebaseAuth.instance;
  register(AppUser appUser) async {
    final UserCredential = await auth.createUserWithEmailAndPassword(
      email: appUser.email ?? '',
      password: appUser.password ?? '',
    );
    return UserCredential;
  }

  // login
  login(AppUser appUser) async {
    final UserCredential = await auth.signInWithEmailAndPassword(
      email: appUser.email ?? '',
      password: appUser.password ?? '',
    );
    return UserCredential;
  }
}
