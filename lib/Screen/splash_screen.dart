import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/home_page.dart';
import 'package:new_agrisoil_app/Screen/welcome_page.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  int splashtime = 3;
  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return welcome_page();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     height: 300,
          //     width: 300,
          //     child: Image.asset('Asset/logo_daun.png'),
          //   ),
          // ),
          // Text(
          //   'AGRISOIL',
          //   style: GoogleFonts.poppins(
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //       color: Color(0xff37C668)),
          // ),
          // Text(
          //   'Supported',
          //   style: GoogleFonts.poppins(
          //       fontSize: 12,
          //       fontWeight: FontWeight.bold,
          //       color: Color(0xff37C668)),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 300,
              width: 300,
              child: Image.asset("Asset/lpdp.png"),
            ),
          ),
        ],
      )),
    );
  }
}
