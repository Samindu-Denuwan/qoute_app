import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qoute_app/common/app_bar.dart';
import 'package:qoute_app/common/constants.dart';
import 'package:qoute_app/common/reusable_quotes.dart';
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
          style: appStyle(Colors.black, 20, FontWeight.w400),),
      ),
      body: FutureBuilder(
        future: quotesNotifier.getRandomQuote(),
        builder: (
    context, snapshot) {
         var randomQuotes= snapshot.data;
        return randomQuotes != null?Center(
        child: ReusableQuotes(
            randomQuotes: randomQuotes,
            quote: "\" ${randomQuotes.quote} \"",
            author: " ${randomQuotes.author}",
            style: appStyle(Colors.black, 18, FontWeight.w500),
            style_author: appStyle(Colors.grey, 16, FontWeight.w400))
    ): Center(child: CircularProgressIndicator(color: Colors.black,));



      },));
  }
}



