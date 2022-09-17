import 'package:cng_mobile/data/bloc/CollectionBloc.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/collection/regularGood.dart';
import 'package:cng_mobile/ui/components/goodLike.dart';
import 'package:cng_mobile/ui/components/collection/promoGood.dart';
import 'package:flutter/material.dart';

import 'common/progressIndicator.dart';

class CollectionFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionFeed();

}

class _CollectionFeed extends State<CollectionFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      child: StreamBuilder(
        stream : collectionBlock.collection,
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            collectionBlock.fetchCollection();
            return progressIndicator();
          }
          List promo = snapshot.data!.where((element) => element.promoted != null).toList();
          GoodModel? promoGood = null;
          if (promo.length!=0){
            promoGood = promo[0]; 
          }
          return Column(
            children: [
              promoGood != null ? PromoGood(good: promoGood,) : SizedBox(),
              SizedBox(
                height: 7,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(promoGood != null ? snapshot.data!.length-1 : snapshot.data!.length, (index) {
                return RegularGood(good: snapshot.data![index],);
              }),
            ),
            ],
          );
        },
    )),
    );
  }
}