import 'package:flutter/material.dart';

Widget progressIndicator() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: new Color(0xffFF0000),
          ),
        ),
      )
    ],
  );
}
