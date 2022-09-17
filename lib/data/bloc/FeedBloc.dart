import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/data/repository/feed.dart';
import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class FeedBloc{

  List<String> _tagsFilter = [];
  String _categoryFilter = 'clothes';
  List <GoodModel> _goods = [];
  List<String> allTags = [
    'sustainable',
    'sports'
  ];

  setCategory(String? category) {
    if (category == null) {
      _category.add(_categoryFilter);
      return;
    }
    _categoryFilter = category;
    _goods = [];
    _getFeed();
  }

  changeTagState(String tag) {
    if (tag == '') {
      _tags.add([]);
      return;
    }
    if (_tagsFilter.contains(tag)){
      _tagsFilter = _tagsFilter.map((t) => t == tag ? '' : t).where((element) => element!='').toList();
    } else {
      _tagsFilter.add(tag);
    }

    _goods = _goods.where((good){
      for (var goodTag in good.tags) {
        if (!_tagsFilter.contains(goodTag)) {
          return false;
        }
      }
      return true;
    }).toList();
    _getFeed();
  }

  final _category = PublishSubject<String>();
  Stream<String> get category => _category.stream;

  final _tags = PublishSubject<List<String>>();
  Stream<List<String>> get tags => _tags.stream;

  final _feed = PublishSubject<List<GoodModel>>();
  Stream<List<GoodModel>> get feed => _feed.stream;

  _getFeed() async {
    _category.add(_categoryFilter);
     _tags.add(_tagsFilter);
    getFeed(_tagsFilter, _categoryFilter).then((feed) {
      feed.forEach((feedItem) {_goods.add(feedItem);});
      _feed.add(_goods);
    });
  }

  goNext(){
     _goods = _goods..removeAt(0);
     _feed.add(_goods);
     if (_goods.length<=4) {
      _getFeed();
     }
  }

  setLike(int goodId, bool liked) async {
    String uuid = await getUuid();
    Dio client = await getApiClient();
    if (liked) {
      client.post('/like', data: {
        'good_id': goodId,
        'uid': uuid
      });
    } else {
      client.post('/dislike', data: {
        'good_id': goodId,
        'uid': uuid
      });
    }
    _goods = _goods.map((e){
      if (e.id == goodId) {
        e.liked = liked;
      }
      return e;
    }).toList();
    _feed.add(_goods);
  }

  FeedBloc(){
    _getFeed();
  }


}

FeedBloc feedBloc = FeedBloc();