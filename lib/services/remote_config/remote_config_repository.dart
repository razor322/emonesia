import 'package:emonesia/services/remote_config/remote_config_data_source.dart';

class RemoteConfigRepository {
  final RemoteConfigDataSource remoteConfigDataSource;

  RemoteConfigRepository(this.remoteConfigDataSource);
  Future<String> getApiBaseUrl() async {
    return await remoteConfigDataSource.getStringURL('api_base_url');
  }
}
