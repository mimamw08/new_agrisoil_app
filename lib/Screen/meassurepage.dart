import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/alat1.dart';
import 'package:new_agrisoil_app/Screen/alat2.dart';
import 'package:new_agrisoil_app/Screen/alat6.dart';
import 'package:new_agrisoil_app/Screen/alat9.dart';

class meassurePage extends StatefulWidget {
  meassurePage({Key? key}) : super(key: key);

  @override
  State<meassurePage> createState() => _meassurePageState();
}

class _meassurePageState extends State<meassurePage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController ?? TabController(length: 2, vsync: this),
          indicator: BoxDecoration(
            color: Colors.green, // warna latar belakang penyorotan
            borderRadius: BorderRadius.circular(10), // radius border penyorotan
          ),
          labelColor: Colors.black,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(CupertinoIcons.add), Text('Tambah Data')],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Icon(CupertinoIcons.folder), Text('Alat Saya')],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController ?? TabController(length: 2, vsync: this),
        children: [
          Center(
              child: Column(
            children: [
              SizedBox(
                height: 30,
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
                height: 30,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                                    .circular(
                                                                        5)),
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
          )),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => alat_1()));
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
                                  'Alat 1',
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => alat6()));
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
                                  'Alat 6',
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => alat9()));
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
                                  'Alat 9',
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => alat2()));
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
                          )
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
          ),
        ],
      ),
    );
  }
}
