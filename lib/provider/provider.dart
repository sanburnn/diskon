import 'dart:convert';

import 'package:diskon/model/diskon.dart';
import 'package:diskon/api/resource.dart';
import 'package:diskon/main.dart';
import 'package:diskon/model/gajiModel.dart';
import 'package:diskon/model/loginModel.dart';
import 'package:diskon/model/mahasiswaModel.dart';
import 'package:diskon/model/propertiModel.dart';
import 'package:flutter/material.dart';

class PostDataProvider extends ChangeNotifier {
  List<GetMahasiswa> _maha = [];
  List<GetMahasiswa> get maha => _maha;
  Diskon post = Diskon();
  late GajiModel gajiModel;
  late LoginModel loginModel;

  

  bool loading = false;
  Future<void> getMahasiswa() async {
    final res = await Api().getMahasiswa();

    try {
      if (res.statusCode == 200) {
        _maha = (jsonDecode(res.body)['data'] as List).isNotEmpty
            ? (jsonDecode(res.body)['data'] as List)
                .map((e) => GetMahasiswa.fromJson(e))
                .toList()
            : [];
      } else {
        _maha = [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  getPostData(context) async {
    loading = true;
    post = await getDiskon(context);

    loading = false;

    notifyListeners();
  }

  kirimGaji(context, title, userId) async {
    loading = true;
    gajiModel = await postDummy(context, title, userId);
    loading = false;
    notifyListeners();
  }
  loginApp(context, email, pass) async{
    loginModel = await login(context, email, pass);

    notifyListeners();
  }
}
