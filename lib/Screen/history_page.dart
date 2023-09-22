import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/alat1.dart';
import 'package:new_agrisoil_app/Screen/alat2.dart';
import 'package:new_agrisoil_app/Screen/alat6.dart';
import 'package:new_agrisoil_app/Screen/alat9.dart';

class history_page extends StatefulWidget {
  history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: Container(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 40,
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
                          'Kamu punya 4 alat',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => alat2()));
                        },
                        child: Container(
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
                              'Alat 2',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => alat_1()));
                      //   },
                      //   child: Container(
                      //     height: 60,
                      //     width: 80,
                      //     decoration: BoxDecoration(
                      //         color: Colors.green,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: Column(children: [
                      //       SizedBox(
                      //         height: 8,
                      //       ),
                      //       Icon(
                      //         Icons.extension_rounded,
                      //         color: Colors.white,
                      //       ),
                      //       SizedBox(
                      //         height: 5,
                      //       ),
                      //       Text(
                      //         'Alat 1',
                      //         style: TextStyle(color: Colors.white),
                      //       )
                      //     ]),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => alat6()));
                        },
                        child: Container(
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
                              'Alat 3',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => alat9()));
                        },
                        child: Container(
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
                              'Alat 5',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Container(
                      //   height: 60,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //       color: Colors.green,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Column(children: [
                      //     SizedBox(
                      //       height: 8,
                      //     ),
                      //     Icon(
                      //       Icons.extension_rounded,
                      //       color: Colors.white,
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Text(
                      //       'data',
                      //       style: TextStyle(color: Colors.white),
                      //     )
                      //   ]),
                      // ),
                      // Container(
                      //   height: 60,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //       color: Colors.green,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Column(children: [
                      //     SizedBox(
                      //       height: 8,
                      //     ),
                      //     Icon(
                      //       Icons.extension_rounded,
                      //       color: Colors.white,
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Text(
                      //       'data',
                      //       style: TextStyle(color: Colors.white),
                      //     )
                      //   ]),
                      // )
                    ],
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //       height: 60,
                  //       width: 80,
                  //       decoration: BoxDecoration(
                  //           color: Colors.green,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Column(children: [
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //         Icon(
                  //           Icons.extension_rounded,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text(
                  //           'data',
                  //           style: TextStyle(color: Colors.white),
                  //         )
                  //       ]),
                  //     ),
                  //     Container(
                  //       height: 60,
                  //       width: 80,
                  //       decoration: BoxDecoration(
                  //           color: Colors.green,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Column(children: [
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //         Icon(
                  //           Icons.extension_rounded,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text(
                  //           'data',
                  //           style: TextStyle(color: Colors.white),
                  //         )
                  //       ]),
                  //     ),
                  //     Container(
                  //       height: 60,
                  //       width: 80,
                  //       decoration: BoxDecoration(
                  //           color: Colors.green,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Column(children: [
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //         Icon(
                  //           Icons.extension_rounded,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text(
                  //           'data',
                  //           style: TextStyle(color: Colors.white),
                  //         )
                  //       ]),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
