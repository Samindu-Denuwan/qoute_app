import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/common/constants.dart';
import 'package:qoute_app/models/random_quotes_model.dart';

class ReusableQuotes extends StatelessWidget {
  final String quote, author;
  final TextStyle style, style_author;
  const ReusableQuotes({
    super.key,
    required this.randomQuotes, required this.quote, required this.author, required this.style, required this.style_author,
  });

  final Quotes? randomQuotes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(quote,
            style: style,),
          SizedBox(height: 10.h,),
          Text(author,
            style: style_author,),
        ],
      ),
    );
  }
}
