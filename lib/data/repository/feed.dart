import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';

Future<List<GoodModel>> getFeed(List<String> tags, String category) async {
  String uuid = await getUuid();
  Dio client = await getApiClient();
  // TODO: client.get()
  return [
    GoodModel.fromJson({
      'id': 43,
      'name' : 'Some dope',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    }),
        GoodModel.fromJson({
      'id': 43,
      'name' : 'Really really good',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    }),
            GoodModel.fromJson({
      'id': 43,
      'name' : 'Really really good',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    }),
            GoodModel.fromJson({
      'id': 43,
      'name' : 'Really really good',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    }),
            GoodModel.fromJson({
      'id': 43,
      'name' : 'Really really good',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    }),
            GoodModel.fromJson({
      'id': 43,
      'name' : 'Really really good',
      'brand' : 'TNF',
      'img' : 'https://img01.ztat.net/article/spp-media-p1/cad292a987564fb4b0e39e596a792713/2957fc6a39db4345b11a740cecd65831.jpg?imwidth=1800',
      'liked' : false,
      'price' : 150,
      'category' : 'clothes',
      'tags' : ['test'],
      'url' : 'https://google.com'
    })
  ];
}
