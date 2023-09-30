import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/routes.dart';
import 'package:shortlink_apps/view/detail_page.dart';
import 'package:shortlink_apps/view/home_page.dart';
import 'package:shortlink_apps/view/list_my_url.dart';
import 'package:shortlink_apps/view/testloading.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ShortlinkProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: const HomePageShortLink(),
          initialRoute: "/",
          routes: routes),
    );
  }
}
