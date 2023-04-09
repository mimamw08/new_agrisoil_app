import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/encode&decode/keamanan.dart';

class calculator extends StatefulWidget {
  calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  TextEditingController test = new TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference dbref = FirebaseDatabase.instance.ref('user/data');

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
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.black)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kalkulator',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Hitung pupuk tanamanmu',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 100,
                      // decoration:
                      //     BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Image.asset('Asset/calculator.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
