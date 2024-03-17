import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test/routes/app_route_config.dart';
import 'package:test/util/HIVETESTING.dart';
import 'package:test/views/contact_screen/contact_screen.dart';
import 'package:test/views/home_screen/home.dart';
import 'package:go_router/go_router.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyRoutes().router.routeInformationParser,
      routerDelegate: MyRoutes().router.routerDelegate,
      routeInformationProvider: MyRoutes().router.routeInformationProvider,
    );
  }
}
