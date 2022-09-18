import 'package:cng_mobile/data/bloc/CollectionBloc.dart';
import 'package:cng_mobile/data/bloc/FeedBloc.dart';
import 'package:rxdart/rxdart.dart';

class NavigationBloc{

  int _tab = 0;

  final _activeTab = PublishSubject<int>();
  Stream<int> get tab => _activeTab.stream;

  setTab(int newTab){
    _tab = newTab;
    _activeTab.add(_tab);
    if (newTab == 0) {
      feedBloc.updateFeed();
    } else {
      collectionBlock.fetchCollection();
    }
  }

  NavigationBloc(){
    _activeTab.add(1);
  }

}

NavigationBloc navigationBloc = new NavigationBloc();