import 'package:cng_mobile/data/bloc/FeedBloc.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/feedCards/feedCard.dart';
import 'package:flutter/material.dart';

class FeedCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedCards();
}

class _FeedCards extends State<FeedCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: feedBloc.feed,
            builder: (context, AsyncSnapshot<List<GoodModel>> snapshot) {
              if (snapshot.hasData && snapshot.data!.length != null && snapshot.data!.length>= 2) {
                return Container(
                  child: Stack(
                    children: [
                      FeedCard(card: snapshot.data![0]),
                      FeedCard(card: snapshot.data![1])
                    ],
                  )
                );
              } else {
                return CircularProgressIndicator();
              }

            }
          )
        );
  }
}
