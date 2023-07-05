
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qoute_app/common/constants.dart';
import '../models/random_quotes_model.dart';

class QuotesNotifier extends ChangeNotifier{
  List<Quotes> _randomQuotes = [];

  List<Quotes> get randomQuotes => _randomQuotes;

  set randomQuotes(List<Quotes> value) {
    _randomQuotes = value;
    notifyListeners();
  }

  Future<Quotes> getRandomQuote()async{
    Response response =await get(Uri.parse("https://dummyjson.com/quotes/random"));
    if(response.statusCode==200){
      Map<String,dynamic> body = jsonDecode(response.body);
      print(body.toString());
      return Quotes.fromJson(body);
    }else{
      throw Exception(response.statusCode);
    }

  }
}