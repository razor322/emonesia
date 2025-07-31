import 'package:emonesia/services/prediction/prediction_data_source.dart';
import 'package:emonesia/services/remote_config/remote_config_data_source.dart';
import 'package:get_it/get_it.dart';

void initDataSourceModule(GetIt locator) {
  locator.registerLazySingleton<RemoteConfigDataSource>(
      () => RemoteConfigDataSource());
  locator.registerLazySingleton<PredictionDataSource>(
      () => PredictionDataSource());
}
