import 'package:flutter/material.dart';

class predict_page extends StatefulWidget {
  predict_page({Key? key}) : super(key: key);

  @override
  State<predict_page> createState() => _predict_pageState();
}

class _predict_pageState extends State<predict_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text('Predict'),
        ),
      ),
    );
  }
}
