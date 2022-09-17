import 'package:cached_network_image/cached_network_image.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/feedFilters.dart';
import 'package:cng_mobile/ui/components/typography/headings.dart';
import 'package:cng_mobile/ui/containers/goodPage.dart';
import 'package:cng_mobile/utils/firstn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoGood extends StatelessWidget {
  GoodModel good;
  PromoGood({required this.good});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
      GestureDetector(child: Container(
        height: 180,
        width: 290,
        child: Row(
          children: [
            Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h4(firstn(good.name, 15)),
                          Image.asset('assets/arrow.png')
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width * 0.95,
                          imageUrl: good.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 10,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      for (var tag in good.tags)
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            FeedTag(tag, true),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      h2(good.price.toString() + "₣"),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Text(
                        'by ' + good.brand,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Center(
                          child: h3('MORE'),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ), onTap: () {
        Navigator.push(context, new CupertinoPageRoute(builder: (context) => GoodPage(good: good)));
      },),
      Positioned(
        bottom: -25,
        right: -15,
        child: Image.asset('assets/melon.png'),
      )
    ]);
  }
}
