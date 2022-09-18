import 'package:cng_mobile/data/repository/auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  String gender = 'none';
  changeGender(String g) {
    if (g == gender) {
      setGender(g);
      Navigator.pop(context);
    }
    this.setState(() {
      gender = g;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'How do you indentify yourself?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 220,
              child: Text(
                'This information would help us to provide better user experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: gender == 'male' ? Colors.black : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          gender == 'male' ? 'GO' : 'MEN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: gender != 'male'
                                  ? Colors.black
                                  : Colors.white),
                        )),
                      ),
                      onTap: () {
                        changeGender('male');
                      },
                    ),
                  ),
                  Container(
                    width: 5,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Expanded(
                      child: GestureDetector(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color:
                              gender == 'women' ? Colors.black : Colors.white),
                      child: Center(
                          child: Text(
                        gender == 'women' ? 'GO' : 'WOMEN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: gender != 'women'
                                ? Colors.black
                                : Colors.white),
                      )),
                    ),
                    onTap: () {
                      changeGender('women');
                    },
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Text('SKIP/OTHER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    Container(
                      height: 3,
                      width: 130,
                      decoration: BoxDecoration(color: new Color(0xffFF0000)),
                    )
                  ],
                ),
              ),
              onTap: () {
                setGender('o');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
