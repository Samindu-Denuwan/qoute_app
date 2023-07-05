import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/common/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  const AppBarWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,
        style: appStyle(Colors.black, 20.sp, FontWeight.w400),),
    );
  }
}