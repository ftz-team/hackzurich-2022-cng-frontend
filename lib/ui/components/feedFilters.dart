import 'package:cng_mobile/data/bloc/FeedBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FeedFilters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedFilters();

}

Widget FeedTag(String name, bool isActive) {
  return GestureDetector(
    onTap: (){
      feedBloc.changeTagState(name);
    },
    child: Container(
    margin: EdgeInsets.only(
      right: 8
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      color: isActive ? Colors.black : Colors.white,
      border: Border.all( color: Colors.black, width: 2)
    ),
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
      ),
    ),
  ),
  );
}

class _FeedFilters extends State<FeedFilters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      child: StreamBuilder(
        stream : feedBloc.tags,
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (!snapshot.hasData) {
            feedBloc.changeTagState('');
            return SizedBox();
          }
          return Row(
            children: [
              Expanded(
                flex: 6,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i in feedBloc.allTags) FeedTag(i, snapshot.data!.contains(i))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ]
      );
      })
    );
  }
  
}