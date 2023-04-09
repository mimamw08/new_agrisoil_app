import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/register_page.dart';

import '../Navbar/navbar.dart';

class verifikasinohp extends StatefulWidget {
  verifikasinohp({Key? key}) : super(key: key);

  @override
  State<verifikasinohp> createState() => _verifikasinohpState();
}

class _verifikasinohpState extends State<verifikasinohp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset('Asset/plants.png'),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 270,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Masuk',
                            style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontSize: 24,
                                fontWeight: FontWeight.bold))),
                  ],
                )
              ],
            ),
            Container(
              height: 380,
              width: 350,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  //border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14))),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black)
                        ),
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //autentikasi textfield
                            SizedBox(
                              height: 90,
                              width: 200,
                              child: TextFormField(
                                obscureText: false,
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 196, 196, 196),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  labelText: 'Masukkan kode autentikasi',
                                ),
                                validator: (value) {
                                  if (value == null || value.length < 5) {
                                    return 'Masukkan kode autentikasi salah';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 45,
                              width: 296,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Persistent_navbar()));
                                  }
                                },
                                child: const Text('Verifikasi'),
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
                            InkWell(
                              child: GestureDetector(
                                onTap: () {
                                  _resendkode();
                                },
                                child: Text(
                                  'Kirim ulang kode autentikasi',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 65,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: 'Belum punya akun? ',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w700))),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                register_page()));
                                  },
                                  child: RichText(
                                      text: TextSpan(
                                          text: 'Daftar',
                                          style: GoogleFonts.roboto(
                                              color: Colors.green,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w700))),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }

  Future<void> _resendkode() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Kode Berhasil Dikirim Ulang')],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Tutup'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
