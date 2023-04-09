import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              height: 130,
              width: 340,
              decoration: BoxDecoration(
                  //: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 200,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Riwayat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Kamu punya %jmlhAlat% alat',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 100,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.asset('Asset/gambardaun.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              width: 300,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih alatmu :',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.extension_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
