import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/rootpage.dart';
import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/loginsignuppage.dart';
import 'ui/splash/splash.dart';
import 'ui/detailedpost/detailedpost.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String root = '/splash';
  static const String detailedpost = '/detailedpost';

  static Post post;

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    root: (BuildContext context) => RootPage(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    detailedpost: (context) =>
        DetailedPost(ModalRoute.of(context).settings.arguments),
  };
}
