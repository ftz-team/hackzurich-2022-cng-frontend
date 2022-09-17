import 'package:cng_mobile/data/consts/common.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

Future<bool> isFirstTime() async {
  final prefs = await SharedPreferences.getInstance();
  bool? notFirstTime = await prefs.getBool(NOT_FIRST_TIME_FLAG);
  if (notFirstTime != null && notFirstTime) {
    return false;
  }
  await prefs.setBool(NOT_FIRST_TIME_FLAG, true);
  return true;
}

Future<String> getUuid() async {
  final prefs = await SharedPreferences.getInstance();
  String? prevUuid = prefs.getString(UUID_STORAGE_PATH);
  if (prevUuid != null) {
    return prevUuid;
  }
  
  String newUuid = Uuid().v4();
  prefs.setString(UUID_STORAGE_PATH, newUuid);

  return newUuid;
}

Future<Dio> getApiClient () async {
  
  Dio client = Dio(BaseOptions(
    baseUrl: API_BASE_URL,
  ));


  return client;
}