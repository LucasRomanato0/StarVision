import 'package:flutter/material.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/login/ui/login_page.dart';
import 'package:mobile/pages/register/ui/register_page.dart';

Map<String, dynamic> routerApp(RouteSettings settings) => {
      //Login
      AppRoutes.login: MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginPage(),
      ),

      //Register
      AppRoutes.register: MaterialPageRoute(
        settings: settings,
        builder: (context) => const RegisterPage(),
      ),
    };
