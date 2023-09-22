import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/new_logo'),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.high,
      priority: Priority.high,
      enableVibration: true,
      playSound: true,
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}

class FirebaseDatabaseService_alat2N {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi1(alat2)/Penambahan pupuk KCL')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}

class FirebaseDatabaseService_alat2P {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi1(alat2)/Penambahan pupuk SP36')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}

class FirebaseDatabaseService_alat2K {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi1(alat2)/Penambahan pupuk Urea')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}

class FirebaseDatabaseService_alat3N {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi2(alat3)/Penambahan pupuk KCL')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}

class FirebaseDatabaseService_alat3P {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi2(alat3)/Penambahan pupuk SP36')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}

class FirebaseDatabaseService_alat3K {
  final databaseReference = FirebaseDatabase.instance.reference();

  void startListeningForValueChanges() {
    databaseReference
        .child('prediksi2(alat3)/Penambahan pupuk Urea')
        .onValue
        .listen((event) {
      final value = event.snapshot.value;

      if (value != null && value is double && value >= 0.1) {
        // Munculkan notifikasi jika nilai >= 0.1
        final notificationService = NotificationService();
        notificationService.showNotification(
          title: 'Perubahan Nilai',
          body: 'Segera lihat halaman prediksi',
        );
      }
    });
  }
}
