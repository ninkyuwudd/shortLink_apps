import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';
import 'package:shortlink_apps/widget/result_widget.dart';

class LoadingShort extends StatefulWidget {
  const LoadingShort({super.key});

  @override
  State<LoadingShort> createState() => _LoadingShortState();
}

class _LoadingShortState extends State<LoadingShort> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    if (provider.isloading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Text("");
    }
  }
}
