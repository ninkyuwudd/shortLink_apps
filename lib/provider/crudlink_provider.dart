import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shortlink_apps/model/short_url_model.dart';
import 'package:shortlink_apps/service/linkList_service.dart';

class CrudListLink extends ChangeNotifier {
  late List<DataLink> link = [];
  List<DataLink> get links => link;

  Future refreshLink() async {
    this.link = await LinkListService.instance.readAllLink();
    notifyListeners();
  }

  Future<void> insertLink(DataLink link) async {
    final createdLink = await LinkListService.instance.create(link);
    links.add(createdLink);
    refreshLink();
    notifyListeners();
  }

  Future<void> updateLink(DataLink link, int id) async {
    await LinkListService.instance.update(link, id);
    refreshLink();
    notifyListeners();
  }

  Future<void> delete(int id) async {
    await LinkListService.instance.delete(id);
    refreshLink();
  }
}
