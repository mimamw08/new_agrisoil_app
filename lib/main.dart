import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_agrisoil_app/Screen/splash_screen.dart';
import 'package:new_agrisoil_app/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_agrisoil_app/service_auth/notifikasi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationService = NotificationService();
  await notificationService.initialize();

  final firebaseDatabaseService_alat2N = FirebaseDatabaseService_alat2N();
  final firebaseDatabaseService_alat2P = FirebaseDatabaseService_alat2P();
  final firebaseDatabaseService_alat2K = FirebaseDatabaseService_alat2K();

  final firebaseDatabaseService_alat3N = FirebaseDatabaseService_alat3N();
  final firebaseDatabaseService_alat3P = FirebaseDatabaseService_alat3P();
  final firebaseDatabaseService_alat3K = FirebaseDatabaseService_alat3K();

  firebaseDatabaseService_alat2N.startListeningForValueChanges();
  firebaseDatabaseService_alat2P.startListeningForValueChanges();
  firebaseDatabaseService_alat2K.startListeningForValueChanges();

  firebaseDatabaseService_alat3N.startListeningForValueChanges();
  firebaseDatabaseService_alat3P.startListeningForValueChanges();
  firebaseDatabaseService_alat3K.startListeningForValueChanges();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SI Soil',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: splash_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
