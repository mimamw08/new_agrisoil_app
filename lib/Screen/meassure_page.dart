import 'package:flutter/material.dart';

class meassure_page extends StatefulWidget {
  meassure_page({Key? key}) : super(key: key);

  @override
  State<meassure_page> createState() => _meassure_pageState();
}

class _meassure_pageState extends State<meassure_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text('Meassure'),
        ),
      ),
    );
  }
}
