import 'package:cached_network_image/cached_network_image.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/typography/headings.dart';
import 'package:cng_mobile/ui/containers/goodPage.dart';
import 'package:cng_mobile/utils/firstn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegularGood extends StatelessWidget {
  GoodModel good;
  RegularGood({required this.good});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 220,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.95,
                    imageUrl: good.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: h4(good.name),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'by ' + firstn(good.brand, 7),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11),
                              ),
                              h4(good.price.toString() + "₣"),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.push(context,
            new CupertinoPageRoute(builder: (context) => GoodPage(good: good)));
      },
    );
  }
}
