import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:new_agrisoil_app/Navbar/navbar.dart';
import 'package:new_agrisoil_app/Screen/loginnohp.dart';
import 'package:new_agrisoil_app/Screen/register_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:progress_dialog/progress_dialog.dart';

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.center,
        child: Container(
          // decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(
                height: 100,
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
                height: 400,
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
                              //Email Textfield
                              TextFormField(
                                controller: _emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 196, 196, 196),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    prefixIcon: Icon(Icons.email_outlined),
                                    fillColor: Colors.white,
                                    //filled: true,
                                    labelText: 'Email',
                                    hintText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? 'Masukkan Email'
                                    : null,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //Password Textfield
                              TextFormField(
                                obscureText: !_passwordVisible,
                                controller: _passController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 196, 196, 196),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        if (mounted)
                                          setState(() {
                                            _passwordVisible = true;
                                          });
                                      },
                                      onTapCancel: () {
                                        if (mounted)
                                          setState(() {
                                            _passwordVisible = false;
                                          });
                                      },
                                      child: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    prefixIcon: Icon(Icons.lock),
                                    fillColor: Colors.white,
                                    //filled: true,
                                    labelText: 'Password',
                                    hintText: 'Password'),
                                validator: (PassCurrentValue) {
                                  RegExp regex = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  var passNonNullValue = PassCurrentValue ?? "";
                                  if (passNonNullValue.isEmpty) {
                                    return ('Masukkan Passoword');
                                  } else if (passNonNullValue.length < 7) {
                                    return ('Password harus mempunyai 8 karakter');
                                  } else if (!regex
                                      .hasMatch(passNonNullValue)) {
                                    return ('Gunakan upper,lower,digit dan karakter spesial');
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 45,
                                width: 296,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _submit();
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
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              loginnomorhp()));
                                },
                                child: Container(
                                  height: 45,
                                  width: 296,
                                  decoration:
                                      BoxDecoration(color: Color(0xffCFF2DB)),
                                  child: Center(
                                      child: Row(
                                    children: [
                                      SizedBox(
                                        width: 36,
                                      ),
                                      Icon(Icons.phone_android),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Masuk dengan nomor HP',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
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
                                        text: 'Lupa Password?',
                                        style: GoogleFonts.roboto(
                                            color: Colors.green,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w700))),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _submit() async {
    final DatabaseReference database = FirebaseDatabase.instance.ref();
    final ProgressDialog pr = ProgressDialog(context);

    pr.style(
      progress: 50.0,
      message: "Please wait...",
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    if (_formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passController.text.trim());

        if (credential.user!.emailVerified) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Persistent_navbar()));
        } else {
          Fluttertoast.showToast(msg: 'Perlu Verifikasi email terlebih dahulu');
        }
        Fluttertoast.showToast(msg: "Berhasil Login");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Persistent_navbar()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Fluttertoast.showToast(msg: 'Email belum terdaftar');
        } else if (e.code == 'wrong-password') {
          Fluttertoast.showToast(msg: 'Password salah');
        }
      }
    }
  }
}
