import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortlink_apps/widget/result/result_widget.dart';

import '../../provider/shortlink_provider.dart';

class ResultShowWidget extends StatefulWidget {
  const ResultShowWidget({super.key});

  @override
  State<ResultShowWidget> createState() => _ResultShowWidgetState();
}

class _ResultShowWidgetState extends State<ResultShowWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShortlinkProvider>(context);
    return FutureBuilder(
        future: provider.shortenUrlFuture,
        builder: (context, snaps) {
          if (provider.isloading) {
            return const CircularProgressIndicator();
          } else if (snaps.hasData) {
            provider.getSortedUrlString(snaps.data.toString());
            return ResultWidget(
              urlResult: snaps.data.toString(),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text("Insert URL"),
              ),
            );
          }
        });
  }
}
