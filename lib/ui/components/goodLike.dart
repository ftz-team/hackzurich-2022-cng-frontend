import 'package:cng_mobile/data/models/goodModel.dart';
import 'package:flutter/material.dart';

class GoodLike extends StatefulWidget {
  GoodModel good;
  GoodLike({required this.good});
  @override
  State<StatefulWidget> createState() => _GoodLike(good);

}

class _GoodLike extends State<GoodLike> {
  bool liked = false;
  _GoodLike(GoodModel good){
      liked = good.liked;
  }

  toggleLike(){
    if (this.liked) {
      // TODO: call unlike
    } else {
      // TODO: call like api
    }
    this.setState(() {
      liked = !this.liked;
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2000)
      ),
      child: GestureDetector(
        onTap: toggleLike,
        child: this.liked ? Image.asset('assets/liked.png') : Image.asset('assets/unliked.png'),
      ),
    );
  }

}