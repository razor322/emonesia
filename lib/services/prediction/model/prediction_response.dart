// To parse this JSON data, do
//
//     final predictionResponse = predictionResponseFromJson(jsonString);

import 'dart:convert';

PredictionResponse predictionResponseFromJson(String str) =>
    PredictionResponse.fromJson(json.decode(str));

String predictionResponseToJson(PredictionResponse data) =>
    json.encode(data.toJson());

class PredictionResponse {
  List<DetailEmosi> detailEmosi;
  String dominantLabel;
  int jumlahDominan;
  String keyword;
  String outputFile;
  String pdfUrl;
  String persentase;

  PredictionResponse({
    required this.detailEmosi,
    required this.dominantLabel,
    required this.jumlahDominan,
    required this.keyword,
    required this.outputFile,
    required this.pdfUrl,
    required this.persentase,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) =>
      PredictionResponse(
        detailEmosi: List<DetailEmosi>.from(
            json["detail_emosi"].map((x) => DetailEmosi.fromJson(x))),
        dominantLabel: json["dominant_label"],
        jumlahDominan: json["jumlah_dominan"],
        keyword: json["keyword"],
        outputFile: json["output_file"],
        pdfUrl: json["pdf_url"],
        persentase: json["persentase"],
      );

  Map<String, dynamic> toJson() => {
        "detail_emosi": List<dynamic>.from(detailEmosi.map((x) => x.toJson())),
        "dominant_label": dominantLabel,
        "jumlah_dominan": jumlahDominan,
        "keyword": keyword,
        "output_file": outputFile,
        "pdf_url": pdfUrl,
        "persentase": persentase,
      };
}

class DetailEmosi {
  int jumlah;
  String labelEmosi;

  DetailEmosi({
    required this.jumlah,
    required this.labelEmosi,
  });

  factory DetailEmosi.fromJson(Map<String, dynamic> json) => DetailEmosi(
        jumlah: json["jumlah"],
        labelEmosi: json["label_emosi"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah": jumlah,
        "label_emosi": labelEmosi,
      };
}
