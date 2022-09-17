import 'package:cng_mobile/ui/components/feedCards/feedCards.dart';
import 'package:cng_mobile/ui/components/feedCategoryHeader.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedScreen();

}

class _FeedScreen extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          FeedCategoryHeader(),
          SizedBox(
            height: 20,
          ),
          FeedCards(),
          SizedBox(
            height: 50,
          ),
        ]
      ),
    );
  }

}