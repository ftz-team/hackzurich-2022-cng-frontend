import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';

Future<List> getFeed(List<String> tags, String category) async {
  String uuid = await getUuid();
  Dio client = await getApiClient();
  Response backendFeed = await client.get('/getFeed', queryParameters: {
    'uid': uuid,
    'category': category,
    'tags': tags.join(" ")
  });
  List<dynamic> goods =  backendFeed.data.map((el) {
    return GoodModel.fromJson(el);
  }).toList();
  return goods;
}
