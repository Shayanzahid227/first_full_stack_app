import 'package:flutter/material.dart';

import 'package:girl_clan/UI/chat/chat_list/chat_list_screen.dart';

import 'package:girl_clan/UI/home/home_screen.dart';
import 'package:girl_clan/UI/profile/profile_screen.dart';
import 'package:girl_clan/core/others/base_view_model.dart';

class RootViewModel extends BaseViewModel {
  int currentIndex = 0;
  void selectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [HomeScreen(), ChatListScreen(), ProfileScreen()];
}
