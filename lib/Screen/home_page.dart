import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:new_agrisoil_app/Screen/login_page.dart';
import 'package:new_agrisoil_app/encode&decode/keamanan.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late TooltipBehavior _tooltipBehavior;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String dropdownValue = 'N';
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

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    profilberubah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    logout();
                    Fluttertoast.showToast(msg: "Berhasil Keluar");
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: login_page(), withNavBar: false);
                  },
                  child: Text(
                    'logout',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 120,
                      width: 250,
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [BoxShadow(blurRadius: 2)]),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text('$date'),
                          Container(
                            height: 90,
                            child: ListView(
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '%hslprdct%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '%hslprdct%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '%hslprdct%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '%hslprdct%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '%hslprdct%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButton<String>(
                                        // Step 3.
                                        value: dropdownValue,
                                        // Step 4.
                                        items: <String>[
                                          'N',
                                          'P',
                                          'K',
                                          'pH',
                                          'Moist'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(fontSize: 18),
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
                                      Text('nama tanaman/tanah')
                                    ],
                                  ),
                                  Text(
                                    '%avgnpk%',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                  // Chart title
                                  title: ChartTitle(text: 'Grafik Tanah'),
                                  // Enable legend
                                  //legend: Legend(isVisible: true),
                                  // Enable tooltip
                                  tooltipBehavior: _tooltipBehavior,
                                  series: <LineSeries<SalesData, String>>[
                                    LineSeries<SalesData, String>(
                                        dataSource: <SalesData>[
                                          SalesData('Jan', 35),
                                          SalesData('Feb', 28),
                                          SalesData('Mar', 34),
                                          SalesData('Apr', 32),
                                          SalesData('May', 40),
                                          SalesData('Jun', 10),
                                          SalesData('Jul', 12),
                                          SalesData('Aug', 20),
                                          SalesData('Sep', 25),
                                          SalesData('Oct', 21),
                                          SalesData('Nov', 33),
                                          SalesData('Des', 38)
                                        ],
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.year,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                        // Enable data label
                                        dataLabelSettings:
                                            DataLabelSettings(isVisible: true))
                                  ]))
                        ],
                      ),
                    )
                  ],
                )),
              ],
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
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double? y;
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
