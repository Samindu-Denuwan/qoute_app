
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qoute_app/common/constants.dart';
import '../models/random_quotes_model.dart';

class QuotesNotifier extends ChangeNotifier{
  List<Quotes> _quotes = [];

  List<Quotes> get quotes => _quotes;

  set quotes(List<Quotes> value) {
    _quotes = value;
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

  Future<List<Quotes>> getQuotes()async {
    Response response = await get(Uri.parse("https://dummyjson.com/quotes"));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      print(body.toString());
      List<dynamic> data = body["quotes"];
      _quotes = data.map((quote) => Quotes.fromJson(quote)).toList();
      return _quotes;
    } else {
      throw Exception(response.statusCode);
    }
  }
}