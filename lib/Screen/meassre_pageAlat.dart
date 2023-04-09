import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/meassure_page.dart';

class alatsaya extends StatefulWidget {
  alatsaya({Key? key}) : super(key: key);

  @override
  State<alatsaya> createState() => _alatsayaState();
}

class _alatsayaState extends State<alatsaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => meassure_page()));
                      },
                      icon: Icon(CupertinoIcons.add),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Tambah alat')],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                    )),
                SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.folder),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Alat Saya')],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 300,
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [Image.asset('Asset/Maps.png')],
              ),
            ),
            SizedBox(
              height: 20,
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
      ),
    );
  }
}
