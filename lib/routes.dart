import 'package:flutter/material.dart';
import 'package:shortlink_apps/view/detail_page.dart';
import 'package:shortlink_apps/view/home_page.dart';
import 'package:shortlink_apps/view/list_my_url.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomePageShortLink(),
  '/detail': (context) => const DetailShortlink(),
  '/myUrl': (context) => const MyListUrl()
};
