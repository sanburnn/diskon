// To parse this JSON data, do
//
//     final diskon = diskonFromMap(jsonString);

import 'dart:convert';

class Diskon {
    Diskon({
        this.besaran,
        this.disk2,
    });

    Besaran? besaran;
    Besaran? disk2;

    factory Diskon.fromJson(String str) => Diskon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Diskon.fromMap(Map<String, dynamic> json) => Diskon(
        besaran: Besaran.fromMap(json["Besaran"]),
        disk2: Besaran.fromMap(json["Disk2"]),
    );

    Map<String, dynamic> toMap() => {
        "Besaran": besaran!.toMap(),
        "Disk2": disk2!.toMap(),
    };
}

class Besaran {
    Besaran({
        this.descriptions,
        this.name,
        this.picture,
    });

    String? descriptions;
    String? name;
    String? picture;

    factory Besaran.fromJson(String str) => Besaran.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Besaran.fromMap(Map<String, dynamic> json) => Besaran(
        descriptions: json["Descriptions"],
        name: json["Name"],
        picture: json["Picture"],
    );

    Map<String, dynamic> toMap() => {
        "Descriptions": descriptions,
        "Name": name,
        "Picture": picture,
    };
}
