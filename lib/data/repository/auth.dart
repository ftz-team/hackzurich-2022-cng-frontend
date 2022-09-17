import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';

void setGender(String gender) async {
  Dio client = await getApiClient();
  String uid = await getUuid();
  client.post('/setGender', data: {
    'uid': uid,
    'gender': gender == 'male' ? 'm' : gender == 'women' ? 'f' : 'o'
  });
}