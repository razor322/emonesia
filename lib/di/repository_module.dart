import 'package:emonesia/services/prediction/prediction_repository.dart';
import 'package:emonesia/services/remote_config/remote_config_repository.dart';
import 'package:get_it/get_it.dart';

void initRepositoryModule(GetIt locator) {
  locator.registerLazySingleton<RemoteConfigRepository>(
      () => RemoteConfigRepository(locator()));
  locator.registerLazySingleton<PredictionRepository>(
      () => PredictionRepository(locator()));
}
