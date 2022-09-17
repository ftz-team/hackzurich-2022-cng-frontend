import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';

void setGender(String gender) async {
  Dio client = await getApiClient();
  client.post('/setGender', data: {
    'uid': getUuid(),
    'gender': gender == 'male' ? 'm' : gender == 'women' ? 'f' : 'o'
  });
}