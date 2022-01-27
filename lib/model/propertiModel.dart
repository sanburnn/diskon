// To parse this JSON data, do
//
//     final getProperti = getPropertiFromMap(jsonString);

import 'dart:convert';

class GetProperti {
  GetProperti({
    this.kosan1,
    this.kosan2,
    this.kosan3,
  });

  Kosan? kosan1;
  Kosan? kosan2;
  Kosan3? kosan3;

  factory GetProperti.fromJson(String str) =>
      GetProperti.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetProperti.fromMap(Map<String, dynamic> json) => GetProperti(
        kosan1: Kosan.fromMap(json["kosan1"]),
        kosan2: Kosan.fromMap(json["kosan2"]),
        kosan3: Kosan3.fromMap(json["kosan3"]),
      );

  Map<String, dynamic> toMap() => {
        "kosan1": kosan1!.toMap(),
        "kosan2": kosan2!.toMap(),
        "kosan3": kosan3!.toMap(),
      };
}

class Kosan {
  Kosan({
    this.harga,
    this.lokasi,
    this.nama,
  });

  int? harga;
  String? lokasi;
  String? nama;

  factory Kosan.fromJson(String str) => Kosan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kosan.fromMap(Map<String, dynamic> json) => Kosan(
        harga: json["harga"],
        lokasi: json["lokasi"],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "harga": harga,
        "lokasi": lokasi,
        "nama": nama,
      };
}

class Kosan3 {
  Kosan3({
    this.harga,
    this.lokasi,
    this.nama,
  });

  int? harga;
  String? lokasi;
  String? nama;

  factory Kosan3.fromJson(String str) => Kosan3.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kosan3.fromMap(Map<String, dynamic> json) => Kosan3(
        harga: json["harga"],
        lokasi: json["lokasi "],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "harga": harga,
        "lokasi ": lokasi,
        "nama": nama,
      };
}
