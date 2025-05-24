import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:itc_pert2/services/user_services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final UserService service = new UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                service.addUserWithAutoID('prabowo', '123');
              },
              child: Text("User Baru"),
            ),
            ElevatedButton(
              onPressed: () {
                service.getAllUserData();
              },
              child: Text("get user"),
            ),
            ElevatedButton(
              onPressed: () {
                service.updateUser('bsQj6vijsvcS5yV03rsb', 'Mamank');
              },
              child: Text("update user"),
            ),
            ElevatedButton(
              onPressed: () {
                service.deleteUser('bsQj6vijsvcS5yV03rsb');
              },
              child: Text("delete user"),
            ),
          ]),
        ),
      ),
    );
  }
}
