import 'package:get/get.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:girl_clan/core/model/app_user.dart';
import 'package:girl_clan/core/others/base_view_model.dart';
import 'package:girl_clan/core/services/data_base_services.dart';

class ProfileViewModel extends BaseViewModel {
  DataBaseServices _db = DataBaseServices();
  AppUser? currentUser;
  loadUser() async {
    setState(ViewState.busy);
    try {
      currentUser = await _db.getCurrentUserData();
      print('name: ${currentUser?.name}');
      notifyListeners();
    } catch (e) {
      print("Error loading user: $e");
    }
    setState(ViewState.idle);
  }
}
