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
  String type;

  PredictionRequest({
    required this.keyword,
    required this.startDate,
    required this.endDate,
    required this.type,
  });

  factory PredictionRequest.fromJson(Map<String, dynamic> json) =>
      PredictionRequest(
        keyword: json["keyword"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "startDate": startDate,
        "endDate": endDate,
        "type": type,
      };
}
