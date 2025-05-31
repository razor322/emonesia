import 'package:dartz/dartz.dart';
import 'package:emonesia/services/lib/model/result_response.dart';
import 'package:emonesia/services/prediction/model/prediction_request.dart';
import 'package:emonesia/services/prediction/model/prediction_response.dart';
import 'package:emonesia/services/prediction/prediction_data_source.dart';

class PredictionRepository {
  final PredictionDataSource source;
  PredictionRepository(this.source);

  Future<Either<ResultResponse, PredictionResponse>> fetchPrediction(
          PredictionRequest predictionRequest) async =>
      source.fetchPrediction(predictionRequest);
}
