import 'package:flutter/material.dart';

class history_page extends StatefulWidget {
  history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text('History'),
        ),
      ),
    );
  }
}
