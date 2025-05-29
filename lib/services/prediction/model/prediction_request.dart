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
  DateTime startDate;
  DateTime endDate;

  PredictionRequest({
    required this.keyword,
    required this.startDate,
    required this.endDate,
  });

  factory PredictionRequest.fromJson(Map<String, dynamic> json) =>
      PredictionRequest(
        keyword: json["keyword"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}
