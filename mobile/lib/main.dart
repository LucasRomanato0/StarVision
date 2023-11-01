import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/app_navigation.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/login/ui/pages/login_page.dart';
import 'package:mobile/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'StarVision LTDA',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginPage(),
          initialRoute: AppRoutes.login,
          onGenerateRoute: (settings) => routerApp(settings)[settings.name],
        ),
      );
}

// return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'StarVision LTDA',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const LoginPage(),
//     );