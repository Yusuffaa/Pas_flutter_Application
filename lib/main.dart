import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "PAS flutter 11 PPLG 3",
      initialRoute: Routes.loginclonefix,
      getPages: Routes.myPages,
    );
  }
}


