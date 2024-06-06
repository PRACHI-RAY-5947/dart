import 'package:flutter/material.dart';
import 'package:e_comm_pr1/utils/routes.dart';
import 'package:e_comm_pr1/views/screens/home_Page.dart';
import 'package:e_comm_pr1/views/screens/Detail_Page.dart';
import 'package:e_comm_pr1/views/screens/cart_Page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const homePage(),
        //  MyRoutes.detailPage: (context) => const detailPage(),
      },
    );
  }
}
