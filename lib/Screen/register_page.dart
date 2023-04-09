import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:new_agrisoil_app/service_auth/auth_service.dart';
import 'package:new_agrisoil_app/encode&decode/keamanan.dart';
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
  TextEditingController _phoneController = TextEditingController();
  late bool _passwordVisible;
  TextEditingController test = TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference dbref = FirebaseDatabase.instance.ref('user/datauser');
  String spasi = " ";
  String final_key = '';

  var encryptnama;
  var encryptemail;
  var encryptpassword;
  var encryptnohp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
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
                      height: 445,
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
                            height: 425,
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                          prefixIcon:
                                              Icon(Icons.email_outlined),
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
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 196, 196, 196),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                                        } else if (passNonNullValue.length <
                                            7) {
                                          return ('Password harus mempunyai 8 karakter');
                                        } else if (!regex
                                            .hasMatch(passNonNullValue)) {
                                          return ('Gunakan upper,lower,digit dan karakter spesial');
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //no.hp textfiel
                                    TextFormField(
                                      obscureText: false,
                                      controller: _phoneController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 196, 196, 196),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        labelText: 'No. HP',
                                        hintText: '08xxxxxxxxxx',
                                        prefixIcon: Icon(Icons.phone),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length < 10) {
                                          return 'Masukkan Nomor HP Anda';
                                        } else {
                                          return null;
                                        }
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
                                        child: const Text('Daftar'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {},
                                    //   child: Container(
                                    //     height: 45,
                                    //     width: 296,
                                    //     decoration:
                                    //         BoxDecoration(color: Color(0xffCFF2DB)),
                                    //     child: Center(
                                    //         child: Row(
                                    //       children: [
                                    //         SizedBox(
                                    //           width: 36,
                                    //         ),
                                    //         Icon(Icons.phone_android),
                                    //         SizedBox(
                                    //           width: 10,
                                    //         ),
                                    //         Text(
                                    //           'Daftar dengan nomor HP',
                                    //           style: GoogleFonts.poppins(
                                    //               fontSize: 14,
                                    //               fontWeight: FontWeight.w600),
                                    //         ),
                                    //       ],
                                    //     )),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 15,
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
                                                    fontWeight:
                                                        FontWeight.w700))),
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
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void _submit() async {
    // Reference image = FirebaseStorage.instance
    //     .ref()
    //     .child('foto_user/blank-profile-picture-973460_1280-300x300.jpg');
    // String imageUrl = await image.getDownloadURL();

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
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passController.text.trim());

        await userCredential.user!.sendEmailVerification();
        Fluttertoast.showToast(
            msg: 'Email verifikasi sudah dikirim segera cek email');
        String uid = userCredential.user!.uid;
        //encryptemail = encryptString(_nameController.toString(), key);
        if (userCredential.user != null) {
          Map<String, dynamic> pelanggan = {
            'nama': _nameController.text.toString(),
            'email': _emailController.text.toString(),
            'password': _passController.text.toString(),
            'nohp': _phoneController.text.toString(),
            'uid': uid,
          };
          dbref.child('/$uid').set(pelanggan);
          await pr.show();
          Fluttertoast.showToast(msg: "Berhasil daftar");

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => login_page()));
        } else {
          Fluttertoast.showToast(msg: "Akun sudah terdaftar");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: 'Email Telah Terdaftar');
        }
      }
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Akun telah terdaftar'),
                Text('Mohon masukkan akun baru'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
