import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qoute_app/common/constants.dart';
import 'package:qoute_app/common/reusable_quotes.dart';
import 'package:qoute_app/controllers/quotes_provider.dart';
import 'package:qoute_app/pages/view_qoute_page/view_quotes_page.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quotesNotifier = Provider.of<QuotesNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes",
          style: appStyle(Colors.black, 20, FontWeight.w400),),
      ),
      body: FutureBuilder(
        future: quotesNotifier.getQuotes(),
        builder: (context, snapshot) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child:quotesNotifier.quotes.isNotEmpty? Padding(
              padding:  EdgeInsets.only(bottom: 10.h),
              child: ListView.builder(
                itemCount: quotesNotifier.quotes.length,
                itemBuilder: (context, index) {
                  var data = quotesNotifier.quotes;
                  return data.isNotEmpty? GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>  ViewQuotesPage(quote: data[index].quote.toString(), author: data[index].author.toString()),));
                    },
                    child: Container(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(data[index].quote.toString(),
                              style: appStyle(Colors.black, 16, FontWeight.w500),),
                            SizedBox(height: 5.h,),
                            Text(data[index].author.toString(),
                              style: appStyle(Colors.grey, 14, FontWeight.w400),),
                          ],
                        ),
                      ),
                    ),
                  ): const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
              },),
            ):const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );

      },),
    );
  }
}
