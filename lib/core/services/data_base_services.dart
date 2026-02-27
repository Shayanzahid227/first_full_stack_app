import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:girl_clan/core/model/app_user.dart';

class DataBaseServices {
  ///
  ///. store user data in dataBase
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String get currentUserId => _auth.currentUser?.uid ?? '';
  setUserData(AppUser appUser) async {
    try {
      await _db.collection("Users").doc(appUser.id).set(appUser.toJson()).then((
        onValue,
      ) {
        Get.snackbar("Success", 'User information saved');
      });
    } catch (e) {
      print("Error while uploading user data $e");
    }
  }

  ///
  /// get user data from dataBase
  ///

  // Future getUserData(AppUser appUser) async {
  //   try {
  //     final doc = await _db.collection('Users').doc(appUser.id).get();
  //     if (doc.exists) {
  //       Get.snackbar("Success", 'User data retrieved successfully');
  //       return AppUser.fromJson((doc.data()), appUser.id);
  //     } else {
  //       Get.snackbar("Error", "User data not found");
  //       return null;
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to get user data");
  //     return null;
  //   }
  // }

  ///
  ///. get current user data
  ///
  Future<AppUser?> getCurrentUserData() async {
    try {
      final doc = await _db.collection('Users').doc(currentUserId).get();
      if (doc.exists) {
        return AppUser.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }
}
