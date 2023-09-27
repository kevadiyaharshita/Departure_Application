import 'package:departure_application/utils/MyRoutes.dart';
import 'package:departure_application/views/screens/Home_Page.dart';
import 'package:departure_application/views/screens/Settings.dart';
import 'package:departure_application/views/screens/Slok_Page.dart';
import 'package:departure_application/views/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/Theme_Controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeController(preferences: preferences),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.splashSceen,
      themeMode: Provider.of<ThemeController>(context).getTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.slockPage: (context) => SlokPage(),
        MyRoutes.settingPage: (context) => SettingPage(),
        MyRoutes.splashSceen: (context) => SplashScreen(),
      },
    );
  }
}
