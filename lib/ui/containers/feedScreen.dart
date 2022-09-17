import 'package:cng_mobile/ui/components/feedCards/feedCards.dart';
import 'package:cng_mobile/ui/components/feedCategoryHeader.dart';
import 'package:cng_mobile/ui/components/feedFilters.dart';
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
          const SizedBox(
            height: 20,
          ),
          FeedCategoryHeader(),
          const SizedBox(
            height: 10,
          ),
          FeedFilters(),
          const SizedBox(
            height: 20,
          ),
          FeedCards(),
          const SizedBox(
            height: 20,
          ),
        ]
      ),
    );
  }

}