import 'package:craft_panel/api.dart';
import 'package:craft_panel/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final api = Api();

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onix Panel',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
