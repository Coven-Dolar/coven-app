// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import '../repository.dart';
//
// class FirebaseFCM {
//   final Repository repository = Repository();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//   Future<String> _config() async {
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         // _navigateToItemDetail(message);
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // _navigateToItemDetail(message);
//       },
//     );
//     _firebaseMessaging.onIosSettingsRegistered.listen((data) {});
//     _firebaseMessaging
//         .requestNotificationPermissions(IosNotificationSettings());
//
//     return await _firebaseMessaging.getToken();
//   }
//
//   Future registerTokenFCM() async {
//     String token = await _config();
//     FormData formData = new FormData.fromMap({
//       "device_id": token.substring(1, 100),
//       "registration_id": token,
//       "type": (Platform.isAndroid) ? 'android' : 'ios',
//     });
//     repository.sendTokenFCMAPI(formData);
//   }
// }
