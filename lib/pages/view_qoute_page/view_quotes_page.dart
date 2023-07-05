import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/common/constants.dart';

class ViewQuotesPage extends StatelessWidget {
  final String quote;
  final String author;
  const ViewQuotesPage({Key? key, required this.quote, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(quote,
              style: appStyle(Colors.black, 18, FontWeight.w500,),),
            SizedBox(height: 10.h,),
            Text(author,
              style: appStyle(Colors.grey, 16, FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
