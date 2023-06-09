import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_agrisoil_app/Navbar/navbar.dart';
import 'package:new_agrisoil_app/Screen/login_page.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Persistent_navbar();
          } else {
            return login_page();
          }
        });
  }
}
