import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:new_agrisoil_app/Screen/graph_page.dart';
import 'package:new_agrisoil_app/Screen/history_page.dart';
import 'package:new_agrisoil_app/Screen/login_page.dart';
import 'package:new_agrisoil_app/encode&decode/keamanan.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String uid = FirebaseAuth.instance.currentUser!.uid;

  String cekUid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference profil = FirebaseDatabase.instance.ref();
  DateTime date = DateTime.now();
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  //String formattgl = DateFormat.yMMMEd().format(date);
  var wktuskrng;
  var nama;
  var emailuser;
  var nohpuser;

  var hsldekripnama;
  var hsldekriemailuser;
  var hsldekrinohpuser;

  var word;

  var nilaiN_alat2;
  var nilaiN_alat3;
  var nilaiP_alat2;
  var nilaiP_alat3;
  var nilaiK_alat2;
  var nilaiK_alat3;

  int _nilai = 0;

  double _batteryLevel = 100.0;

  @override
  void initState() {
    profilberubah();
    profilkepuk();
    profilN_alat2();
    profilN_alat3();
    profilP_alat2();
    profilP_alat3();
    profilK_alat2();
    profilK_alat3();
    _listenToValueChanges();
    _animateGauge();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    IconData iconData = Icons.error; // Ikon default

    if (_nilai == 1) {
      iconData = Icons.wifi;
    } else if (_nilai == 2) {
      iconData = Icons.signal_cellular_alt;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        body: SlidingUpPanel(
          isDraggable: false,
          //parallaxEnabled: true
          minHeight: 500,
          maxHeight: 480,
          body: Container(
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        height: 100,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Color(0xff37C668),
                            //border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [BoxShadow(blurRadius: 3)]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('Asset/blank_picture.jpg'),
                              radius: 35,
                            ),
                            Container(
                              height: 80,
                              width: 210,
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.black)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$hsldekripnama',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$hsldekriemailuser',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '$hsldekrinohpuser',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
          ),
          borderRadius: radius,

          panel: Center(
            child: Container(
              height: 420,
              width: 350,
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //container untuk N
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'N',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiN_alat2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'N',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiN_alat3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                  ),
                                ],
                              ))),
                      SizedBox(
                        width: 12,
                      ),
                      //container untuk p
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'P',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiP_alat2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'P',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiP_alat3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                  ),
                                ],
                              ))),
                      SizedBox(
                        width: 12,
                      ),
                      //container untuk k
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, blurStyle: BlurStyle.outer)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'K',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiK_alat2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 2',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Text(
                                          'K',
                                          style: GoogleFonts.poppins(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '$nilaiK_alat3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Alat 3',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                  ),
                                ],
                              ))),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => history_page()));
                        },
                        child: Container(
                            height: 100,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3, blurStyle: BlurStyle.outer)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'Asset/history_icon.png',
                                  color: Colors.greenAccent,
                                  scale: 0.7,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Riwayat',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => graph_Page()));
                        },
                        child: Container(
                            height: 100,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3, blurStyle: BlurStyle.outer)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.graph_square_fill,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Statistik Tanah',
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 165,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3, blurStyle: BlurStyle.outer)
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Jaringan',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Icon(
                              iconData,
                              size: 100,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 165,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3, blurStyle: BlurStyle.outer)
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'Indikator Baterai',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              Container(
                                height: 140,
                                width: 210,
                                child: SfRadialGauge(
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      minimum: 0,
                                      maximum: 100,
                                      //showLabels: false,
                                      showTicks: false,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 10,
                                        color: Colors.grey.shade300,
                                      ),
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          widget: Container(
                                            child: Text(
                                              '$_batteryLevel',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          angle: 86,
                                          positionFactor: 0.9,
                                        )
                                      ],
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          value: _batteryLevel,
                                          width: 10,
                                          color: Colors.green,
                                          enableAnimation: true,
                                        ),
                                        NeedlePointer(
                                          value: _batteryLevel,
                                          enableAnimation: true,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }

  void profilberubah() {
    profil.child('user/datauser/$cekUid/').onValue.listen((event) {
      print(event.snapshot.value.toString());
      Map profiluser = event.snapshot.value as Map;
      profiluser.forEach((key, value) {
        setState(() {
          nama = profiluser['nama'];
          emailuser = profiluser['email'];
          nohpuser = profiluser['nohp'];
          final key = 'ini kunci rahasia';
          final dekripnama = decryptAES(nama, key);
          final dekripemail = decryptAES(emailuser, key);
          final dekripnomor = decryptAES(nohpuser, key);
          hsldekripnama = dekripnama;
          hsldekriemailuser = dekripemail;
          hsldekrinohpuser = dekripnomor;
        });
      });
    });
  }

  void profilkepuk() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('prediksi2(alat3)/kurang gram').get();
    if (snapshot.exists) {
      word = snapshot.value.toString();
      print(word);
      setState(() {});
    } else {
      word = 'Tanaman Membutuhkan Pupuk';
      print('No data available.');
    }
  }

  void profilN_alat2() async {
    _database
        .child('Alat_Ukur2')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiN_alat2 =
            data[lastRandomKey]['n'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai n: $nilaiN_alat2');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void profilN_alat3() async {
    _database
        .child('Alat_Ukur3')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiN_alat3 =
            data[lastRandomKey]['n'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai n: $nilaiN_alat3');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void profilP_alat2() async {
    _database
        .child('Alat_Ukur2')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiP_alat2 =
            data[lastRandomKey]['p'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai p: $nilaiP_alat2');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void profilP_alat3() async {
    _database
        .child('Alat_Ukur3')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiP_alat3 =
            data[lastRandomKey]['p'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai n: $nilaiP_alat3');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void profilK_alat2() async {
    _database
        .child('Alat_Ukur2')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiK_alat2 =
            data[lastRandomKey]['k'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai n: $nilaiK_alat2');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void profilK_alat3() async {
    _database
        .child('Alat_Ukur3')
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((DatabaseEvent snapshot) {
      var data = snapshot.snapshot.value;
      if (data != null && data is Map) {
        // Pastikan data adalah Map
        var lastRandomKey = data.keys.first;
        nilaiK_alat3 =
            data[lastRandomKey]['k'] as String; // Ubah menjadi tipe yang sesuai
        print('Nilai n: $nilaiK_alat3');
      } else {
        print('Data not found');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void _listenToValueChanges() {
    _database.child('jaringan/kode').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value != null) {
        setState(() {
          _nilai = value as int;
        });
      }
    });
  }

  void _animateGauge() {
    _database.child('gauge/baterai').onValue.listen((event) {
      if (event.snapshot.value != null) {
        double newValue = double.parse(event.snapshot.value.toString());
        if (newValue >= 0 && newValue <= 100) {
          setState(() {
            _batteryLevel = newValue;
          });
        }
      }
    });
  }
}
