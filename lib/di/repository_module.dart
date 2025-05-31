import 'package:emonesia/services/prediction/prediction_repository.dart';
import 'package:get_it/get_it.dart';

void initRepositoryModule(GetIt locator) {
  locator.registerLazySingleton<PredictionRepository>(
      () => PredictionRepository(locator()));
}
