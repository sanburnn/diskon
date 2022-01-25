import 'dart:async';
import 'dart:convert';
import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:diskon/model/diskon.dart';


  Future<Diskon> getDiskon(BuildContext context) async {
    var urll = Uri.parse('https://sinform-967f7-default-rtdb.asia-southeast1.firebasedatabase.app/Diskon.json');

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

