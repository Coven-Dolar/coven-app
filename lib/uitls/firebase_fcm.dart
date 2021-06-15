import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../repository.dart';

class FirebaseFCM {
  final Repository repository = Repository();

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }

  Future<String?> _config() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    return await FirebaseMessaging.instance.getAPNSToken();

  }

  Future registerTokenFCM() async {
    String? token = await _config();
    if (token != null) {
      FormData formData = new FormData.fromMap({
        "device_id": token.substring(1, 100),
        "registration_id": token,
        "type": (Platform.isAndroid) ? 'android' : 'ios',
      });
      repository.sendTokenFCMAPI(formData);
    }

  }
}
