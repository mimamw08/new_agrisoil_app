import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class graph_Page extends StatefulWidget {
  graph_Page({Key? key}) : super(key: key);

  @override
  State<graph_Page> createState() => _graph_PageState();
}

class _graph_PageState extends State<graph_Page> {
  late TooltipBehavior _tooltipBehavior;
  String dropdownValue = 'N';
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Alat_Ukur2');
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  String _selectedValue = 'n'; // Nilai default dropdown
  List<DataPoint> _dataPoints = []; // Default value
  String selectedItem = 'n'; // Default selected item
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();
  List<DataPoint> dataPoints = [];

  var nilaiN_alat2;

  @override
  void initState() {
    // _loadDataPoints();
    // Mendengarkan perubahan pada data
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                          'Statistik',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Silahkan Lihat Statistik Tanaman Kamu Hari ini',
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
                    child: Icon(
                      CupertinoIcons.graph_square_fill,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //kotak grafik alat 2
            Container(
                child: Column(
              children: [
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
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 70,
                          width: 350,
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButton<String>(
                                    value: selectedItem,
                                    items: ['n', 'p', 'k', 'ph', 'moisture']
                                        .map((String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      // Change the type to String?
                                      setState(() {
                                        selectedItem = newValue!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Unsur Tanah',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          )),
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

            SizedBox(
              height: 20,
            ),
            //kotak grafik alat 3
            // Container(
            //     child: Column(
            //   children: [
            //     Container(
            //       height: 430,
            //       width: 380,
            //       decoration: BoxDecoration(
            //         //border: Border.all(color: Colors.black),
            //         color: Colors.white,
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black,
            //             blurRadius: 4,
            //             //offset: Offset(-2, -6)
            //           )
            //         ],
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(8),
            //             topRight: Radius.circular(8)),
            //       ),
            //       child: Column(
            //         children: [
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Container(
            //               height: 70,
            //               width: 350,
            //               // decoration: BoxDecoration(
            //               //     border: Border.all(color: Colors.black)),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       // DropdownButton<String>(
            //                       //   value: dropdownValue,
            //                       //   onChanged: (newValue) {
            //                       //     setState(() {
            //                       //       dropdownValue = newValue!;
            //                       //     });
            //                       //   },
            //                       //   items: [
            //                       //     DropdownMenuItem(
            //                       //       value: 'N',
            //                       //       child: Text('Data 1'),
            //                       //     ),
            //                       //     DropdownMenuItem(
            //                       //       value: 'P',
            //                       //       child: Text('Data 2'),
            //                       //     ),
            //                       //     // Tambahkan lebih banyak item sesuai kebutuhan
            //                       //   ],
            //                       // ),
            //                       // DropdownButton<String>(
            //                       //   value: selectedParameter,
            //                       //   onChanged: _onParameterChanged,
            //                       //   items: <String>[
            //                       //     'n',
            //                       //     'p',
            //                       //     'k',
            //                       //     'ph',
            //                       //     'moisture'
            //                       //   ].map((String value) {
            //                       //     return DropdownMenuItem<String>(
            //                       //       value: value,
            //                       //       child: Text(value),
            //                       //     );
            //                       //   }).toList(),
            //                       // ),
            //                       Text(
            //                         'Unsur Tanah',
            //                         style: GoogleFonts.poppins(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 12),
            //                       )
            //                     ],
            //                   ),
            //                   // Text(
            //                   //   '114.2 ppm',
            //                   //   style: TextStyle(
            //                   //       color: Colors.green,
            //                   //       fontSize: 18,
            //                   //       fontWeight: FontWeight.bold),
            //                   // )
            //                 ],
            //               )),
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Container(
            //             height: 300,
            //             width: 380,
            //             decoration: BoxDecoration(
            //                 //border: Border.all(color: Colors.black)
            //                 ),
            //             child: SfCartesianChart(),
            //           )
            //         ],
            //       ),
            //     )
            //   ],
            // )),
          ],
        ),
      )),
    );
  }

  // void _loadDataPoints() async{
  //   DatabaseReference ref = _database.reference().child('Alat_Ukur2');
  //   // Adjust this query to fetch data for the selected value
  //   ref
  //       .orderByChild('timestamp')
  //       .startAt(
  //           DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch)
  //       .onValue
  //       .listen((event) {
  //     DataSnapshot snapshot = event.snapshot;
  //     Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;
  //     if (values != null) {
  //       setState(() {
  //         _dataPoints.clear();
  //         values.forEach((key, value) {
  //           double? xValue = value['timestamp'] != null
  //               ? double.tryParse(value['timestamp'])
  //               : null;
  //           if (xValue != null) {
  //             DateTime dateTime =
  //                 DateTime.fromMillisecondsSinceEpoch(xValue.toInt());
  //             double yValue = double.parse(value[_selectedValue]);
  //             _dataPoints.add(DataPoint(dateTime, yValue));
  //           }
  //         });
  //       });
  //     }
  //   });
  // }

  // List<DataPoint> getData() {
  //   // Replace with your implementation to fetch data from the realtime database
  //   // and convert it to DataPoint objects
  //   // Sample data for demonstration purposes
  //   return [
  //     DataPoint(
  //         DateTime.now().subtract(Duration(hours: 10)), 10, 20, 30, 40, 50),
  //     DataPoint(
  //         DateTime.now().subtract(Duration(hours: 9)), 15, 25, 35, 45, 55),
  //     DataPoint(
  //         DateTime.now().subtract(Duration(hours: 8)), 20, 30, 40, 50, 60),
  //     // ...
  //   ];
  // }
}

// class DataPoint {
//   final DateTime timestamp;
//   final double value;

//   DataPoint(this.timestamp, this.value);
// }

// class DataPoint {
//   final DateTime timestamp;
//   final double n;
//   final double p;
//   final double k;
//   final double ph;
//   final double moisture;

//   DataPoint(this.timestamp, this.n, this.p, this.k, this.ph, this.moisture);
// }

class DataPoint {
  final dynamic x;
  final dynamic y;

  DataPoint(this.x, this.y);
}
