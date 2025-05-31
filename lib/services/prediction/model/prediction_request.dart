// To parse this JSON data, do
//
//     final predictionRequest = predictionRequestFromJson(jsonString);

import 'dart:convert';

PredictionRequest predictionRequestFromJson(String str) =>
    PredictionRequest.fromJson(json.decode(str));

String predictionRequestToJson(PredictionRequest data) =>
    json.encode(data.toJson());

class PredictionRequest {
  String keyword;
  String startDate;
  String endDate;

  PredictionRequest({
    required this.keyword,
    required this.startDate,
    required this.endDate,
  });

  factory PredictionRequest.fromJson(Map<String, dynamic> json) =>
      PredictionRequest(
        keyword: json["keyword"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "startDate": startDate,
        "endDate": endDate,
      };
}
