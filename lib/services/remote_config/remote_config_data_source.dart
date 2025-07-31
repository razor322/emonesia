import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigDataSource {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  RemoteConfigDataSource() {
    _initRemoteConfig();
  }
  void _initRemoteConfig() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 0),
        minimumFetchInterval: const Duration(seconds: 5),
      ),
    );
    await remoteConfig.fetchAndActivate();
  }

  Future<String> getStringURL(String key) async {
    return remoteConfig.getString(key);
  }
}
