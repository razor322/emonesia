import 'package:dartz/dartz.dart';
import 'package:emonesia/di/application_module.dart';
import 'package:emonesia/resources/constants/app_constants.dart';
import 'package:emonesia/services/lib/api_services.dart';
import 'package:emonesia/services/lib/model/result_response.dart';
import 'package:emonesia/services/prediction/model/prediction_request.dart';
import 'package:emonesia/services/prediction/model/prediction_response.dart';
import 'package:emonesia/services/remote_config/remote_config_repository.dart';
import 'package:emonesia/utils/utility.dart';

class PredictionDataSource extends ApiService {
  final RemoteConfigRepository remoteConfigRepository = locator();

  /// Fetches a prediction from the API.

  Future<Either<ResultResponse, PredictionResponse>> fetchPrediction(
      PredictionRequest predictionRequest) async {
    try {
      final String apiBaseUrl = await remoteConfigRepository.getApiBaseUrl();
      cprint('[DEBUG] API Base URL: $apiBaseUrl', warningIn: 'Prediction API');
      cprint('[DEBUG] Body yang dikirim: ${predictionRequest.toJson()}',
          warningIn: 'Prediction Request API');
      final response = await post(
        apiBaseUrl + AppConstants.BaseRoute,
        body: predictionRequest.toJson(),
      );
      cprint('[DEBUG] Response dari API: $response',
          warningIn: 'Prediction Response API');
      if (response != null) {
        cprint('[DEBUG] Body yang dikirim: ${predictionRequest.toJson()}',
            warningIn: 'Prediction Request API');
        cprint('[DEBUG] Response dari API: $response',
            warningIn: 'Prediction Response API');
        if (response.containsKey('dominant_label')) {
          return Right(PredictionResponse.fromJson(response));
        }
        return Left(ResultResponse(
          status: "Error",
          message: "Unexpected API response format",
        ));
      } else {
        return Left(
            ResultResponse(status: "Error", message: "Failed to get data!"));
      }
    } catch (e) {
      print(e);
      return Left(ResultResponse(status: "Error", message: e.toString()));
    }
  }
}
