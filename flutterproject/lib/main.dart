import 'package:flutter/material.dart';
import 'package:flutterproject/models/account.dart';
import 'package:flutterproject/pages/home_page.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/pages/splash_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Sandy Wahyu Agusta
//NIM 123190145

Future<void> main() async {
  initiateLocalDB();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool status = pref.getBool("LoginStatus") ?? false;
  String username = pref.getString("Username") ?? "";
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: status == true
          ? SplashPage(username: username, isLogin: status)
          : SplashPage(username: "",isLogin: false)));
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAccountModelAdapter());
  await Hive.openBox<UserAccountModel>("user");
}
