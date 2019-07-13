 import 'package:flutter/material.dart';
import 'package:flutter_firestroe/signup_login/SignupPage.dart';
import 'package:flutter_firestroe/splashpage.dart';


import 'home/home.dart';
import 'signup_login/LoginPage.dart';


class RouteSettngsPage extends RouteSettings{
  static Route<dynamic>generateRoute(RouteSettings settings)
  {

    switch(settings.name)
    {
      case "/":
            return MaterialPageRoute(builder: (_)=>SplashPage());
        break;

        case "/login":
        return MaterialPageRoute(builder: (_)=>LoginPage());
        break;
      case "/signup":
        return MaterialPageRoute(builder: (_)=>SignupPage());
        break;
      case "/home":
        return MaterialPageRoute(builder: (_)=>Homepage());
        break;

    }
  }
}