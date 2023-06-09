import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/meassre_pageAlat.dart';
import 'package:new_agrisoil_app/encode&decode/keamanan.dart';

class meassure_page extends StatefulWidget {
  meassure_page({Key? key}) : super(key: key);

  @override
  State<meassure_page> createState() => _meassure_pageState();
}

class _meassure_pageState extends State<meassure_page> {
  TextEditingController npkp201EUI = TextEditingController();
  TextEditingController npkp201ID = TextEditingController();
  TextEditingController npkp201Addres = TextEditingController();

  TextEditingController npkn113EUI = TextEditingController();
  TextEditingController npkn113ID = TextEditingController();
  TextEditingController npkn113Addres = TextEditingController();

  TextEditingController npkpo313EUI = TextEditingController();
  TextEditingController npkpo313ID = TextEditingController();
  TextEditingController npkpo313Addres = TextEditingController();

  final database = FirebaseDatabase.instance.ref();

  String cekUid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference profil = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final add = database.child('$cekUid/');
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
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.add),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Tambah alat')],
                        ))),
                SizedBox(
                    width: 140,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => alatsaya()));
                      },
                      icon: Icon(CupertinoIcons.folder),
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Alat Saya')],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
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
              height: 200,
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
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 350,
                                        width: 330,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'LoRa.id Device EUI',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              controller: npkp201EUI,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device EUI'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device ID',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device ID'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device Address',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device Address'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 300,
                                                child: ElevatedButton(
                                                    onPressed: () async {},
                                                    child: Text('Submit')),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text('NPK P201')),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 350,
                                        width: 330,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'LoRa.id Device EUI',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device EUI'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device ID',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device ID'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device Address',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device Address'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 300,
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text('Submit')),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text('NPK N113')),
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 350,
                                        width: 330,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'LoRa.id Device EUI',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device EUI'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device ID',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device ID'),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Text(
                                              'LoRa.id Device Address',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  hintText:
                                                      'Masukkan LoRa.id Device Address'),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: 300,
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text('Submit')),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text('NPK O313')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
