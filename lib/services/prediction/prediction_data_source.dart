import 'package:dartz/dartz.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/services/lib/api_services.dart';
import 'package:emonesia/services/lib/model/result_response.dart';
import 'package:emonesia/services/prediction/model/prediction_request.dart';
import 'package:emonesia/services/prediction/model/prediction_response.dart';

class PredictionDataSource extends ApiService {
  /// Fetches a prediction from the API.

  Future<Either<ResultResponse, PredictionResponse>> fetchPrediction(
      PredictionRequest predictionRequest) async {
    try {
      final response = await post(
        AppConstants.apiBaseUrl,
        body: predictionRequest.toJson(),
      );
      if (response != null) {
        return Right(PredictionResponse.fromJson(response));
      } else {
        return Left(
            ResultResponse(status: "Error", message: "Failed to check in!"));
      }
    } catch (e) {
      print(e);
      return Left(ResultResponse(status: "Error", message: e.toString()));
    }
  }
}
