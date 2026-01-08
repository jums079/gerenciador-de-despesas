import 'package:flutter/material.dart';
import 'package:gerenciador_de_despesas/view/home_page/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

        // TESTE GIT
      ),
      home: HomePage(),
    );
  }
}
