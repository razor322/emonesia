class ResultResponse {
  ResultResponse({
    required this.status,
    required this.message,
  });

  String status, message;

  factory ResultResponse.fromJson(Map<String, dynamic> json) => ResultResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
