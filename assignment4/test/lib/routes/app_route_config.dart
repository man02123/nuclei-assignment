import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/routes/app_routes_const.dart';
import 'package:test/views/contact_screen/contact_screen.dart';
import 'package:test/views/errpage.dart';
import 'package:test/views/home_screen/home.dart';
import 'package:test/views/new_contact_screen/new_contact.dart';

class MyRoutes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'Homepage',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: HomePage()),
      ),
      GoRoute(
        name: 'ContactScreen',
        path: '/ContactScreen',
        pageBuilder: (context, state) => MaterialPage(child: ContactScreen()),
      ),
      GoRoute(
        name: MyAppRouterConstant.addNewContact,
        path: '/addnewcontact',
        pageBuilder: (context, state) {
          return MaterialPage(child: AddNewContact());
        },
      ),
    ],
  );
}
