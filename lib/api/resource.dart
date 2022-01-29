import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:diskon/model/gajiModel.dart';
import 'package:diskon/model/mahasiswaModel.dart';
import 'package:diskon/model/propertiModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:diskon/model/diskon.dart';

Future<Diskon> getDiskon(BuildContext context) async {
  var urll = Uri.parse(
      'https://sinform-967f7-default-rtdb.asia-southeast1.firebasedatabase.app/Diskon.json');

  try {
    final res = await http.get(urll).timeout(const Duration(seconds: 11));
    // print(res.body);
    if (res.statusCode == 200) {
      return Diskon.fromJson(res.body);
    } else if (res.statusCode == 404) {
      return Diskon.fromJson(res.body);
    } else {
      throw Exception('Failur Respon');
    }
  } on SocketException catch (e) {
    throw Exception(e.toString());
  } on HttpException {
    {
      throw Exception("Tidak ditemukan");
    }
  } on FormatException {
    throw Exception("Request Salah");
  } on TimeoutException catch (e) {
    throw Exception(e.toString());
  }
}

Future<GetProperti> getProperti(BuildContext context) async {
  var urll = Uri.parse(
      'https://sinform-967f7-default-rtdb.asia-southeast1.firebasedatabase.app/properti.json');

  try {
    final res = await http.get(urll).timeout(const Duration(seconds: 11));
    // print(res.body);
    if (res.statusCode == 200) {
      return GetProperti.fromJson(res.body);
    } else if (res.statusCode == 404) {
      return GetProperti.fromJson(res.body);
    } else {
      throw Exception('Failur Respon');
    }
  } on SocketException catch (e) {
    throw Exception(e.toString());
  } on HttpException {
    {
      throw Exception("Tidak ditemukan");
    }
  } on FormatException {
    throw Exception("Request Salah");
  } on TimeoutException catch (e) {
    throw Exception(e.toString());
  }
}

class Api {
  final String base_url = 'https://bosomy-unit.000webhostapp.com/';
  Future<http.Response> getMahasiswa() async {
    var urll = Uri.parse('$base_url/mahasiswa');
    var res = await http.get(urll);

    return getRes(res);
  }

  Future<http.Response> getKosan() async {
    var urll = Uri.parse('$base_url/properti');
    var res = await http.get(urll);

    return getRes(res);
  }

  Future<http.Response> getRes(http.Response res) async {
    try {
      return res;
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak ditemukan");
      }
    } on FormatException {
      throw Exception("Request Salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}

Future<GajiModel> postDummy(
    BuildContext context, String title, String userId) async {
  var body = {"title": title, "userId": userId};

  final res = await http
      .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          headers: {"Content-type": "application/x-www-form-urlencoded"},
          encoding: convert.Encoding.getByName("utf-8"),
          body: body)
      .timeout(const Duration(seconds: 11));

  if (res.statusCode == 201) {
    print(res.statusCode);
    print(res.body);

    return GajiModel.fromJson(convert.json.decode(res.body));
  } else {
    throw Exception('Something went wrong');
  }
}
