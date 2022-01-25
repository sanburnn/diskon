import 'package:diskon/model/diskon.dart';
import 'package:diskon/api/resource.dart';
import 'package:diskon/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDataProvider with ChangeNotifier {
  Diskon post = Diskon();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getDiskon(context);
    loading = false;

    notifyListeners();
  }
}