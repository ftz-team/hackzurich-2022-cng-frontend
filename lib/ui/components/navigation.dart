import 'package:cng_mobile/data/bloc/NavigationBloc.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Navigation();
}

Widget menuItem(String title, bool isActive, int index) {
  return GestureDetector(
    onTap: () {
      navigationBloc.setTab(index);
    },
    child: Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
        ),
            Container(
                height: 3,
                width: index == 0 ? 100 : 150,
                decoration: BoxDecoration(color: isActive ? new Color(0xffFF0000) : Color.fromARGB(0, 255, 0, 0)),
              )
      ],
    ),
  )
  );
}

class _Navigation extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white
      ),
        child: StreamBuilder(
            stream: navigationBloc.tab,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuItem('SEARCH', snapshot.data != 1, 0),
                  menuItem('COLLECTION', snapshot.data == 1, 1),
                ],
              );
            }
          )
        );
  }
}
