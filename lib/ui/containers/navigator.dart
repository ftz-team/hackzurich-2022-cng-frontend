import 'package:cng_mobile/data/bloc/NavigationBloc.dart';
import 'package:cng_mobile/ui/components/Navigation.dart';
import 'package:cng_mobile/ui/containers/feedScreen.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppNavigator();

}

class _AppNavigator extends State<AppNavigator> {
  List<Widget> pages= [
    FeedScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream : navigationBloc.tab,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (!snapshot.hasData) {
            navigationBloc.setTab(0);
            return SizedBox();
          }
          return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10
              ),
              child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: pages[snapshot.data!],
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Navigation()
                    ],
                  ),
                )
              ]
            )
          );
        }
      )
    );
  }

}