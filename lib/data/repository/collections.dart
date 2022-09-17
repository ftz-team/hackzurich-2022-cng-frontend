import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';

Future<List> getCollection() async {
  String uuid = await getUuid();
  Dio client = await getApiClient();
  Response backendFeed = await client.get('/getFavourites', queryParameters: {
    'uid': uuid
  });
  List goods =  backendFeed.data.map((el ) {
    return GoodModel.fromJson(el);
  }).toList();
  return goods;
}
