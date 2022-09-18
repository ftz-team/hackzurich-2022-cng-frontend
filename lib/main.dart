import 'package:cng_mobile/data/repository/getClient.dart';
import 'package:cng_mobile/ui/containers/navigator.dart';
import 'package:cng_mobile/ui/containers/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        backgroundColor: Colors.white
      ),
      home: Main()
    );
  }
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Main();

}

class _Main extends State<Main> {
  @override
  void initState() {
    checkFirstTime();
    super.initState();
  }
  checkFirstTime() async {
    isFirstTime().then((firstTime) => {
      if (firstTime) {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => WelcomePage()))
      } 
    });
  }
  @override
  Widget build(BuildContext context) {
    return AppNavigator();
  }
  
}