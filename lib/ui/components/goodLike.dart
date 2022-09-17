import 'package:cng_mobile/data/bloc/FeedBloc.dart';
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
  late int id;
  _GoodLike(GoodModel good){
      liked = good.liked;
      id = good.id;
  }

  toggleLike(){
    feedBloc.setLike(id, !liked);
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