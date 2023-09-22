import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_agrisoil_app/Screen/login_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../encode&decode/keamanan.dart';

class profil_page extends StatefulWidget {
  profil_page({Key? key}) : super(key: key);

  @override
  State<profil_page> createState() => _profil_pageState();
}

class _profil_pageState extends State<profil_page> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String cekUid = FirebaseAuth.instance.currentUser!.uid;
  DatabaseReference profil = FirebaseDatabase.instance.ref();
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  var hsldekripnama;
  var hsldekriemailuser;
  var hsldekrinohpuser;

  var nama;
  var emailuser;
  var nohpuser;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    profilberubah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 120,
                  width: 500,
                  decoration: BoxDecoration(color: Colors.green),
                ),
                Container(
                  height: 150,
                  width: 200,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('Asset/blank_picture.jpg'),
                        radius: 55,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$hsldekripnama',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 50,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$hsldekriemailuser',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         builder: (context) {
                  //           return Container(
                  //             child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 20,
                  //                 ),
                  //                 Container(
                  //                   height: 200,
                  //                   width: 300,
                  //                   // decoration: BoxDecoration(
                  //                   //     border:
                  //                   //         Border.all(color: Colors.black)),
                  //                   child: Align(
                  //                     alignment: Alignment.center,
                  //                     child: Column(
                  //                       children: [
                  //                         Text(
                  //                           'Masukkan Email baru anda',
                  //                           style: GoogleFonts.poppins(
                  //                               color: Colors.black,
                  //                               fontSize: 16,
                  //                               fontWeight: FontWeight.w700),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         TextFormField(
                  //                           controller: _emailController,
                  //                           obscureText: false,
                  //                           decoration: InputDecoration(
                  //                               enabledBorder:
                  //                                   OutlineInputBorder(
                  //                                       borderSide: BorderSide(
                  //                                           color:
                  //                                               Color.fromARGB(
                  //                                                   255,
                  //                                                   196,
                  //                                                   196,
                  //                                                   196),
                  //                                           width: 2),
                  //                                       borderRadius:
                  //                                           BorderRadius
                  //                                               .circular(5)),
                  //                               prefixIcon:
                  //                                   Icon(Icons.email_outlined),
                  //                               labelText: 'Email',
                  //                               hintText: 'Email'),
                  //                           keyboardType:
                  //                               TextInputType.emailAddress,
                  //                           validator: (email) => email !=
                  //                                       null &&
                  //                                   !EmailValidator.validate(
                  //                                       email)
                  //                               ? 'Masukkan Email'
                  //                               : null,
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         SizedBox(
                  //                           height: 45,
                  //                           width: 300,
                  //                           child: ElevatedButton(
                  //                             onPressed: () async {
                  //                               if (_formKey.currentState!
                  //                                   .validate()) {
                  //                                 final key =
                  //                                     'ini kunci rahasia';
                  //                                 final enkripemail =
                  //                                     encryptAES(
                  //                                         _emailController.text,
                  //                                         key);
                  //                                 await profil
                  //                                     .child(
                  //                                         'user/datauser/$cekUid/')
                  //                                     .update({
                  //                                   'email': enkripemail
                  //                                 });
                  //                                 Fluttertoast.showToast(
                  //                                     msg:
                  //                                         'Email baru berhasil tersimpan');
                  //                                 Navigator.pop(context);
                  //                               }
                  //                             },
                  //                             child: const Text('SIMPAN'),
                  //                             style: ElevatedButton.styleFrom(
                  //                                 primary: Color(0xFF8DC13F),
                  //                                 textStyle: TextStyle(
                  //                                     fontSize: 20,
                  //                                     fontWeight:
                  //                                         FontWeight.w700,
                  //                                     color: Colors.white)),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           );
                  //         });
                  //   },
                  //   child: Icon(
                  //     CupertinoIcons.pencil_circle,
                  //     color: Colors.green,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 50,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$hsldekrinohpuser',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         builder: (context) {
                  //           return Container(
                  //             child: Column(
                  //               children: [
                  //                 SizedBox(
                  //                   height: 20,
                  //                 ),
                  //                 Container(
                  //                   height: 200,
                  //                   width: 300,
                  //                   // decoration: BoxDecoration(
                  //                   //     border:
                  //                   //         Border.all(color: Colors.black)),
                  //                   child: Align(
                  //                     alignment: Alignment.center,
                  //                     child: Column(
                  //                       children: [
                  //                         Text(
                  //                           'Masukkan nomor baru anda',
                  //                           style: GoogleFonts.poppins(
                  //                               color: Colors.black,
                  //                               fontSize: 16,
                  //                               fontWeight: FontWeight.w700),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         TextFormField(
                  //                           obscureText: false,
                  //                           controller: _phoneController,
                  //                           decoration: InputDecoration(
                  //                             enabledBorder: OutlineInputBorder(
                  //                                 borderSide: BorderSide(
                  //                                     color: Color.fromARGB(
                  //                                         255, 196, 196, 196),
                  //                                     width: 2),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(5)),
                  //                             labelText: 'No. HP',
                  //                             hintText: '08xxxxxxxxxx',
                  //                             prefixIcon: Icon(Icons.phone),
                  //                           ),
                  //                           validator: (value) {
                  //                             if (value == null ||
                  //                                 value.length < 10) {
                  //                               return 'Masukkan Nomor HP Anda';
                  //                             } else {
                  //                               return null;
                  //                             }
                  //                           },
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         GestureDetector(
                  //                           onTap: () {
                  //                             Fluttertoast.showToast(
                  //                                 msg: "Berhasil Keluar");
                  //                             PersistentNavBarNavigator
                  //                                 .pushNewScreen(context,
                  //                                     screen: login_page(),
                  //                                     withNavBar: false);
                  //                           },
                  //                           child: Container(
                  //                             height: 40,
                  //                             width: 150,
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.green,
                  //                                 border: Border.all(
                  //                                     color: Colors.green),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(4)),
                  //                             child: Column(
                  //                               children: [
                  //                                 SizedBox(
                  //                                   height: 5,
                  //                                 ),
                  //                                 Text(
                  //                                   'Submit',
                  //                                   style: GoogleFonts.poppins(
                  //                                       fontSize: 16,
                  //                                       fontWeight:
                  //                                           FontWeight.bold,
                  //                                       color: Colors.white),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           );
                  //         });
                  //   },
                  //   child: Icon(
                  //     CupertinoIcons.pencil_circle,
                  //     color: Colors.green,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Fluttertoast.showToast(msg: "Berhasil Keluar");
                PersistentNavBarNavigator.pushNewScreen(context,
                    screen: login_page(), withNavBar: false);
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Log out',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
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

  Future<void> _yestochange_email() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Ingin merubah email?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Ya'),
                  onPressed: () {
                    profil.child('user/datauser/$cekUid/').update({});
                    Fluttertoast.showToast(msg: 'Akun berhasil dihapus');
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Tidak'),
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
