import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/home_page.dart';
import 'package:new_agrisoil_app/Screen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:new_agrisoil_app/service_auth/auth_service.dart';

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
        return AuthService().handleAuthState();
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
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Image.asset("Asset/logo_sisoil.png"),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Supported by',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: Image.asset("Asset/logo_lpdp.png"),
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
