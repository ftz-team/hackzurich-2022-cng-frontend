import 'package:cng_mobile/data/bloc/FeedBloc.dart';
import 'package:cng_mobile/utils/capitalize.dart';
import 'package:flutter/material.dart';

class FeedCategoryHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedCategoryHeader();

}

Widget Category(String name, bool isActive) {
  const activeStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
  const inActiveStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(39, 0, 0, 0),
  );

  return GestureDetector(
    onTap: () {
      feedBloc.setCategory(name);
    },
    child: Container(
      margin: EdgeInsets.only(right: 22),
      child: Text(
        isActive ? capitalize(name) : name,
        style: isActive ? activeStyle : inActiveStyle,
      ),
    ),
  );
}

class _FeedCategoryHeader extends State<FeedCategoryHeader> {
  List<Widget> generateChildrens(String active){
    if (active == 'clothes') {
      return [
          Category('clothes', true),
          Category('stuff', false),
      ];
    }
    return [
          Category('stuff', true),
          Category('clothes', false)
    ];
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream : feedBloc.category,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) {
            feedBloc.setCategory(null);
            return SizedBox();
          }
          return Container(
            margin: EdgeInsets.only(
              top: 40
            ),
            child: Row(
              children: generateChildrens(snapshot.data!),
            ),
          );
        });
  }

}