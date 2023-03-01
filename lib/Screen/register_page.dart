import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class register_page extends StatefulWidget {
  register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  late bool _passwordVisible;
  String spasi = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
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
                                text: 'Daftar',
                                style: GoogleFonts.poppins(
                                    color: Colors.green,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 450,
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
                        height: 410,
                        width: 300,
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black)
                            ),
                        child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  obscureText: false,
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 196, 196, 196),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Nama',
                                    hintText: 'Nama Lengkap',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Masukkan nama';
                                    } else if (value == spasi) {
                                      return null;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      prefixIcon: Icon(Icons.email_outlined),
                                      filled: true,
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
                                  controller: _passController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 196, 196, 196),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      filled: true,
                                      prefixIcon: Icon(Icons.lock),
                                      labelText: 'Password',
                                      hintText: 'Password'),
                                  validator: (PassCurrentValue) {
                                    RegExp regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    var passNonNullValue =
                                        PassCurrentValue ?? "";
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
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    login_page()));
                                      }
                                    },
                                    child: const Text('Daftar'),
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
                                  onTap: () {},
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
                                          'Daftar dengan nomor HP',
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
                                            text: 'Sudah punya akun? ',
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
                                                    login_page()));
                                      },
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Masuk',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.green,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
