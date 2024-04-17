import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_labz/modules/courses/view/courses_screen.dart';
import 'package:vinnovate_labz/modules/login/view/login_screen.dart';

import 'export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: login_screen(),
  ));
}

