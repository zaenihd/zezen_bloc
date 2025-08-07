// To parse this JSON data, do
//
//     final suratModel = suratModelFromJson(jsonString);

import 'dart:convert';

SuratModel suratModelFromJson(String str) => SuratModel.fromJson(json.decode(str));

String suratModelToJson(SuratModel data) => json.encode(data.toJson());

class SuratModel {
    final int code;
    final String message;
    final List<Surat> data;

    SuratModel({
        required this.code,
        required this.message,
        required this.data,
    });

    factory SuratModel.fromJson(Map<String, dynamic> json) => SuratModel(
        code: json["code"],
        message: json["message"],
        data: List<Surat>.from(json["data"].map((x) => Surat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Surat {
    final int nomor;
    final String nama;
    final String namaLatin;
    final int jumlahAyat;
    final TempatTurun tempatTurun;
    final String arti;
    final String deskripsi;
    final Map<String, String> audioFull;

    Surat({
        required this.nomor,
        required this.nama,
        required this.namaLatin,
        required this.jumlahAyat,
        required this.tempatTurun,
        required this.arti,
        required this.deskripsi,
        required this.audioFull,
    });

    factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: tempatTurunValues.map[json["tempatTurun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]).map((k, v) => MapEntry<String, String>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

enum TempatTurun {
    MADINAH,
    MEKAH
}

final tempatTurunValues = EnumValues({
    "Madinah": TempatTurun.MADINAH,
    "Mekah": TempatTurun.MEKAH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
