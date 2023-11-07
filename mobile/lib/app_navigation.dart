import 'package:flutter/material.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/bottom_bar/ui/bottom_navigation_bar.dart';
import 'package:mobile/pages/forgot_password/ui/password_page.dart';
import 'package:mobile/pages/login/ui/pages/login_page.dart';
import 'package:mobile/pages/produtos/produtos_page.dart';
import 'package:mobile/pages/register/ui/pages/register_page.dart';

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

      //Password
      AppRoutes.forgotPassword: MaterialPageRoute(
        settings: settings,
        builder: (context) => const PasswordPage(),
      ),

      //NavigationBar
      AppRoutes.navigationBar: MaterialPageRoute(
        settings: settings,
        builder: (context) => const BottomNavigationBarPage(),
      ),

      //Produtos
      AppRoutes.produtos: MaterialPageRoute(
        settings: settings,
        builder: (context) => ProdutosPage(),
      ),
    };
