import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text("saya"),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
