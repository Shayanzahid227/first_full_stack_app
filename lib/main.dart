import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:girl_clan/UI/auth/login/login.dart';
import 'package:girl_clan/UI/auth/sign_up/sign_up.dart';
import 'package:girl_clan/UI/profile/profile_screen.dart';
import 'package:girl_clan/UI/rough/counter.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase connected successfully!");
  } catch (e) {
    print("❌ Firebase initialization failed: $e");
  }
  printFirebaseProjectName();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          // Remove MultiProvider wrapper
          debugShowCheckedModeBanner: false,
          title: 'first full stack app',
          theme: ThemeData(
            checkboxTheme: CheckboxThemeData(
              side: BorderSide(color: whiteColor, width: 2),
              checkColor: MaterialStateProperty.all(whiteColor),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: transparentColor,
              shadowColor: transparentColor,
              surfaceTintColor: transparentColor,
            ),
            scaffoldBackgroundColor: backGroundColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          defaultTransition: Transition.leftToRight,
          home: counterScreen(),
        );
      },
    );
  }
}

Future<void> printFirebaseProjectName() async {
  final FirebaseApp app = Firebase.app();
  final FirebaseOptions options = app.options;

  final projectId = options.projectId;

  print("🔥 Firebase Project ID: $projectId");
}
