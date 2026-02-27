import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:girl_clan/UI/profile/profile_view_model.dart';
import 'package:girl_clan/core/constants/app_assets.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/core/constants/text_style.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:girl_clan/core/model/app_user.dart';
import 'package:girl_clan/core/services/data_base_services.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final AppUser? appUser;
  DataBaseServices? db;
  ProfileScreen({super.key, this.appUser, this.db});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) {
          final user = model.currentUser;

          if (model.state == ViewState.busy) {
            return Center(child: CircularProgressIndicator());
          }

          if (user == null) {
            return Center(child: Text("No user data found"));
          }
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, color: blackColor),
              ),
              title: Text(
                "Profile",
                style: style16B.copyWith(color: blackColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: blackColor),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ///
                      ///. Circle Avatar
                      ///
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            model.loadUser();
                          },
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: AssetImage(
                              AppAssets()
                                  .appLogo, // replace with NetworkImage if using online
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,

                      ///
                      ///. Name
                      ///
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name: ",
                              style: style14B.copyWith(color: blackColor),
                            ),
                            Text(
                              (user.name ?? "Shayan"),
                              style: style16B.copyWith(color: secondaryColor),
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,

                      ///
                      ///. Email
                      ///
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Email: ",
                              style: style14B.copyWith(color: blackColor),
                            ),
                            Text(
                              (user.email ?? "shayanzahid227@gmail.com"),
                              style: style14B.copyWith(color: secondaryColor),
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,

                      ///. Date of Birth
                      ///
                      Center(
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center, // 👈 centers row content
                          children: [
                            Text(
                              "DOB: ",
                              style: style14B.copyWith(color: blackColor),
                            ),

                            Text(
                              (user.DOB ?? "12 Aug 2000"),
                              style: style14B.copyWith(color: secondaryColor),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,

                      ///
                      ///. Bio
                      ///
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bio: ",
                            style: style14B.copyWith(color: blackColor),
                          ),
                          5.horizontalSpace,
                          Flexible(
                            child: Text(
                              (user.Bio ??
                                  "Passionate Flutter developer, love to build stunning UI and scalable apps."),
                              maxLines: 3,
                              style: style14B.copyWith(color: secondaryColor),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      30.verticalSpace,
                      Text(
                        "My Photos: ",
                        style: style14B.copyWith(color: blackColor),
                      ),
                      20.verticalSpace,
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.99,
                            ),
                        itemCount: 12,
                        shrinkWrap: true,

                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: AssetImage(AppAssets().appLogo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
