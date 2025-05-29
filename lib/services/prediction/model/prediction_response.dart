// To parse this JSON data, do
//
//     final predictionResponse = predictionResponseFromJson(jsonString);

import 'dart:convert';

PredictionResponse predictionResponseFromJson(String str) =>
    PredictionResponse.fromJson(json.decode(str));

String predictionResponseToJson(PredictionResponse data) =>
    json.encode(data.toJson());

class PredictionResponse {
  String dominantLabel;
  int jumlah;
  String keyword;
  String outputFile;
  String persentase;

  PredictionResponse({
    required this.dominantLabel,
    required this.jumlah,
    required this.keyword,
    required this.outputFile,
    required this.persentase,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) =>
      PredictionResponse(
        dominantLabel: json["dominant_label"],
        jumlah: json["jumlah"],
        keyword: json["keyword"],
        outputFile: json["output_file"],
        persentase: json["persentase"],
      );

  Map<String, dynamic> toJson() => {
        "dominant_label": dominantLabel,
        "jumlah": jumlah,
        "keyword": keyword,
        "output_file": outputFile,
        "persentase": persentase,
      };
}
