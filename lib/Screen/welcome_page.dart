import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/login_page.dart';
import 'package:new_agrisoil_app/Screen/register_page.dart';

class welcome_page extends StatefulWidget {
  welcome_page({Key? key}) : super(key: key);

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            height: 300,
            width: 300,
            child: Image.asset('Asset/plants.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Selalu Peduli Dengan ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 19,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700))),
              RichText(
                  text: TextSpan(
                      text: 'Tanaman',
                      style: GoogleFonts.roboto(
                          color: Colors.green,
                          fontSize: 19,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 45,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => login_page()));
              },
              child: const Text('Masuk'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700))),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => register_page()));
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Daftar',
                        style: GoogleFonts.roboto(
                            color: Colors.green,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
