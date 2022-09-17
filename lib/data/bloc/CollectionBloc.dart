import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/data/repository/collections.dart';
import 'package:rxdart/rxdart.dart';

class CollectionBlock {
  List _goods = [];

  final _collection= PublishSubject<List>();
  Stream<List> get collection => _collection.stream;

  fetchCollection(){
    getCollection().then((collection) {
      _goods = collection;
      _collection.add(_goods);
    });
  }

}

CollectionBlock collectionBlock = new CollectionBlock();