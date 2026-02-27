import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girl_clan/core/constants/colors.dart';
import 'package:girl_clan/core/constants/text_style.dart';

class CustomBottomBarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const CustomBottomBarWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onTap, icon: Icon(icon)),
        2.verticalSpace,
        Text(title, style: style14B.copyWith(color: blackColor)),
      ],
    );
  }
}
