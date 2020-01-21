import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hr_management_app/app/auth/login.dart';
import 'package:hr_management_app/app/home/home.dart';


/// Application routes to define all routes in the applications.
class AppRoutes {
  AppRoutes._();

  /// Root route.
  static const String homeRoute = '/';

  /// Login route.
  static const String loginRoute = '/login';

  /// Configure routes using Flutter [router] for application.
  static void configureRoutes(Router router) {
    router.define(homeRoute, handler: _rootHandler);
    router.define(loginRoute, handler: _loginHandler);
  }
}

Handler _rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return const Home(title: 'Home');
  },
);

Handler _loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Login();
  },
);


