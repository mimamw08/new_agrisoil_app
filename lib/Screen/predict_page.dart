import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class predict_page extends StatefulWidget {
  predict_page({Key? key}) : super(key: key);

  @override
  State<predict_page> createState() => _predict_pageState();
}

class _predict_pageState extends State<predict_page> {
  @override
  String dropdownValue = 'N';
  late TooltipBehavior _tooltipBehavior;
  DateTime date = DateTime.now();
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();
  List<DataPoint> dataPoints = [];

  var numberdataN_alat2;
  var numberdataP_alat2;
  var numberdataK_alat2;

  var numberdataN_alat3;
  var numberdataP_alat3;
  var numberdataK_alat3;

  var word;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    profilkepuk();
    profilkepukN_alat2();
    profilkepukP_alat2();
    profilkepukK_alat2();
    profilkepukN_alat3();
    profilkepukP_alat3();
    profilkepukK_alat3();
    databaseReference
        .child('Alat_Ukur3')
        .limitToLast(10)
        .onValue
        .listen((event) {
      // Mendapatkan data dari DataSnapshot
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

      // Menghapus data sebelumnya
      dataPoints.clear();

      // Parsing data ke objek DataPoint
      values.forEach((key, value) {
        num? yValue = num.tryParse(value['n'].toString());
        if (yValue != null) {
          dataPoints.add(DataPoint(key, yValue));
        }
        num? xValue = num.tryParse(value['waktu']);
        if (xValue != null) {
          dataPoints.add(DataPoint(key, xValue));
        }
      });

      // Memperbarui tampilan setelah mendapatkan data
      setState(() {});
    });
    super.initState();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [BoxShadow(blurRadius: 2)],
                color: Colors.white,
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //kotak prediksi
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 120,
                  width: 360,
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [BoxShadow(blurRadius: 2)]),
                  child: Column(
                    children: [
                      Text(
                        'Prediksi Alat 2',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '$date',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 60,
                        child: Container(
                          height: 50,
                          width: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rekomendasi pupuk KCL sejumlah: $numberdataN_alat2 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Rekomendasi pupuk SP36 sejumlah: $numberdataP_alat2 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Rekomendasi pupuk Urea sejumlah: $numberdataK_alat2 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              // Text(
                              //   'Dibutuhkan untuk dipupuk esok hari',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 120,
                  width: 360,
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [BoxShadow(blurRadius: 2)]),
                  child: Column(
                    children: [
                      Text(
                        'Prediksi Alat 3',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '$date',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 60,
                        child: Container(
                          height: 50,
                          width: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rekomendasi pupuk KCL sejumlah: $numberdataN_alat3 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Rekomendasi pupuk SP36 sejumlah: $numberdataP_alat3 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Rekomendasi pupuk Urea sejumlah: $numberdataK_alat3 gram',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              // Text(
                              //   'Dibutuhkan untuk dipupuk esok hari',
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 430,
              width: 380,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    //offset: Offset(-2, -6)
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 350,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          // Step 3.
                          value: dropdownValue,
                          // Step 4.
                          items: <String>['N', 'P', 'K', 'pH', 'Moist']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          // Step 5.
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                        Text(
                          'Unsur Tanah',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: 380,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black)
                        ),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<DataPoint, dynamic>>[
                        LineSeries<DataPoint, dynamic>(
                          dataSource: dataPoints,
                          xValueMapper: (DataPoint data, _) => data.x,
                          yValueMapper: (DataPoint data, _) => data.y!,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  void profilkepuk() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('prediksi1(alat2)/kurang gram').get();
    if (snapshot.exists) {
      word = snapshot.value.toString();
      print(word);
      setState(() {});
    } else {
      word = 'Tanaman Membutuhkan Pupuk';
      print('No data available.');
    }
  }

  void profilkepukN_alat2() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi1(alat2)/Penambahan pupuk KCL')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataN_alat2 = snapshot.value.toString();
        setState(() {});
      }
    });
  }

  void profilkepukP_alat2() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi1(alat2)/Penambahan pupuk SP36')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataP_alat2 = snapshot.value.toString();
        setState(() {});
      }
    });
  }

  void profilkepukK_alat2() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi1(alat2)/Penambahan pupuk Urea')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataK_alat2 = snapshot.value.toString();
        setState(() {});
      }
    });
  }

  void profilkepukN_alat3() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi2(alat3)/Penambahan pupuk KCL')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataN_alat3 = snapshot.value.toString();
        setState(() {});
      }
    });
  }

  void profilkepukP_alat3() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi2(alat3)/Penambahan pupuk SP36')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataP_alat3 = snapshot.value.toString();
        setState(() {});
      }
    });
  }

  void profilkepukK_alat3() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref
        .child('prediksi2(alat3)/Penambahan pupuk Urea')
        .onValue
        .listen((event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        numberdataK_alat3 = snapshot.value.toString();
        setState(() {});
      }
    });
  }
}

class DataPoint {
  final dynamic x;
  final dynamic y;

  DataPoint(this.x, this.y);
}
