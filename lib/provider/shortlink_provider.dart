import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShortlinkProvider extends ChangeNotifier {
  String TitleUrl = "";
  String dateUrl = "";
  String originalUrl = "";
  String sortedUrl = "";

  var isloading = false;
  Future<String>? _shortenUrlFuture;
  get shortenUrlFuture => _shortenUrlFuture;

  void getShortUrl(Future<String> theUrl) {
    _shortenUrlFuture = theUrl;
  }

  void getSortedUrlString(String url) {
    sortedUrl = url;
    notifyListeners();
  }

  void getDataUrl(String title, String date, String oriUrl) {
    TitleUrl = title;
    dateUrl = date;
    originalUrl = oriUrl;
    notifyListeners();
  }

  // untuk fetch data api shortlink nya
  Future<String?> shortenUrl({required String url}) async {
    try {
      final result = await http.post(
          Uri.parse("https://cleanuri.com/api/v1/shorten"),
          body: {'url': url});

      if (result.statusCode == 200) {
        final jsonResult = jsonDecode(result.body);
        return jsonResult['result_url'];
      }
    } catch (e) {
      print("Error $e");
    }
    return null;
  }

  void changeLoading(bool value) {
    isloading = value;
    notifyListeners();
  }

  Future<void> fetch({required String ur}) async {
    try {
      final ShortUrl = await shortenUrl(url: ur);
      isloading = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 3));
      isloading = false;
      print(ShortUrl);
      notifyListeners();
    } catch (e) {
      print("Error : $e");
    }
  }
}
