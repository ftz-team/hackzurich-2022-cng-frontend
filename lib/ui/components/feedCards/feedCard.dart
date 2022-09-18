import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/goodLike.dart';
import 'package:cng_mobile/ui/containers/goodPage.dart';
import 'package:cng_mobile/utils/firstn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget GoodPrice(String price) {
  return Container(
    child: Text(
      price + "₣",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
    ),
  );
}

Widget GoodLabel(String name, String brand) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              firstn(name.toUpperCase(), 9),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 22),
            ),
            Container(
              width: 15,
            ),
            Image.asset(
              'assets/arrow.png',
              height: 14,
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 1),
          child: Text(
            'by ' + brand,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
          ),
        )
      ],
    ),
  );
}

class FeedCard extends StatefulWidget {
  GoodModel card;
  String status = 'stable';
  FeedCard({required this.card, this.status = 'stable'});
  @override
  State<StatefulWidget> createState() => _FeedCard(card: card);
}

class _FeedCard extends State<FeedCard> {
  GoodModel card;
  String status = 'stable';
  _FeedCard({required this.card, this.status = 'stable'});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.rotate(
        angle: 0,
        child:Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.95,
                      imageUrl: card.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: GoodLike(good: card),
                  ),
                  status == 'like'
                      ? Positioned(
                          top: 50,
                          right: 100,
                          child: Container(
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 1,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GoodLabel(card.name, card.brand),
                        GoodPrice(card.price.toString())
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      onTap: () {
        Navigator.push(context,
            new CupertinoPageRoute(builder: (context) => GoodPage(good: card)));
      },
    );
  }
}
