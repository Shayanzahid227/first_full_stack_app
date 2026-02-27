import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girl_clan/UI/root_screen/root_view_model.dart';

import 'package:girl_clan/custom_widget/bottom_bar.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(),
      child: Consumer<RootViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              ///. bottom bar
              ///
              bottomNavigationBar: SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBottomBarWidget(
                        title: 'Home',
                        icon: Icons.home,
                        onTap: () {
                          model.selectedIndex(0);
                        },
                      ),
                      CustomBottomBarWidget(
                        title: 'Chat',
                        icon: Icons.chat,
                        onTap: () {
                          model.selectedIndex(1);
                        },
                      ),
                      CustomBottomBarWidget(
                        title: 'Profile',
                        icon: Icons.person,
                        onTap: () {
                          model.selectedIndex(2);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              body: SafeArea(child: model.screens[model.currentIndex]),
            ),
      ),
    );
  }
}
