import 'package:cached_network_image/cached_network_image.dart';
import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:cng_mobile/ui/components/Navigation.dart';
import 'package:cng_mobile/ui/components/feedFilters.dart';
import 'package:cng_mobile/ui/components/typography/headings.dart';
import 'package:cng_mobile/utils/firstn.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodPage extends StatelessWidget {
  GoodModel good;
  GoodPage({required this.good});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: h2('Right in front of you...'),
                )),
            const SizedBox(
              height: 20,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset('assets/single.png'),
                Positioned(
                  left: 30,
                  top: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      width: 150,
                      height: 200,
                      imageUrl: good.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 250,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    h25(firstn(good.name, 40)),
                                    Text(
                                      'by ' + good.brand,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: h2(good.price.toString() + "₣"),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 15
                            ),
                            child: Row(children: [
                              for (var tag in good.tags) Container(
                                child: Row(children: [
                                  FeedTag(tag, true),
                                  SizedBox(width: 5,)
                                ]),
                              )
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/big-arrow.png'),
                              GestureDetector(
                                onTap: (){
                                  final Uri _url = Uri.parse(good.url);
                                  launchUrl(_url);
                                },
                                child: Text(
                                'BUY', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800
                                ),
                              ),
                              )
                            ],
                          ),
                          SizedBox(height: 30,),

                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
