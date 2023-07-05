import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qoute_app/common/app_bar.dart';
import 'package:qoute_app/common/constants.dart';
import 'package:qoute_app/controllers/quotes_provider.dart';

import '../../models/random_quotes_model.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quotesNotifier = Provider.of<QuotesNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes of the Day",
          style: appStyle(Colors.black, 20.sp, FontWeight.w400),),
      ),
      body: FutureBuilder(
        future: quotesNotifier.getRandomQuote(),
        builder: (
    context, snapshot) {
         var randomQuotes= snapshot.data;
        return randomQuotes != null?Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("\" ${randomQuotes.quote} \"",
                style: appStyle(Colors.black, 18.sp, FontWeight.w500),),
             SizedBox(height: 10.h,),
              Text(randomQuotes.author,
                style: appStyle(Colors.grey.shade500, 16.sp, FontWeight.w400),),
            ],
          ),
        )
    ): Center(child: CircularProgressIndicator(color: Colors.black,));



      },));
  }
}


