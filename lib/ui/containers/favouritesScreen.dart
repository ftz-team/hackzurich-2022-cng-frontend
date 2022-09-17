import 'package:cng_mobile/ui/components/collectionFeed.dart';
import 'package:cng_mobile/ui/components/typography/headings.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionPage();

}

class _CollectionPage extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: h2('There it is...'),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 15,
          ),
          CollectionFeed()
        ],
      ),
    );
  }
}