import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/provider/shortlink_provider.dart';

class ResultWidget extends StatelessWidget {
  final String result;
  const ResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [Text(result)],
      ),
    );
  }
}
