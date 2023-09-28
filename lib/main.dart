import 'package:departure_application/controller/Language_Controller.dart';
import 'package:departure_application/utils/MyRoutes.dart';
import 'package:departure_application/views/screens/English_Home_Page.dart';
import 'package:departure_application/views/screens/English_Slok_Page.dart';
import 'package:departure_application/views/screens/English_Favourite_Page.dart';
import 'package:departure_application/views/screens/Favourite_Page.dart';
import 'package:departure_application/views/screens/Home_Page.dart';
import 'package:departure_application/views/screens/Settings_Page.dart';
import 'package:departure_application/views/screens/Slok_Page.dart';
import 'package:departure_application/views/screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/English_Like_Contoller.dart';
import 'controller/LikeController.dart';
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
        ChangeNotifierProvider(
          create: (context) => LanguageController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => EnglishLikeController(preferences: preferences),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeController(preferences: preferences),
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
        MyRoutes.english_home: (context) => EnglishHomePage(),
        MyRoutes.english_slok_Page: (context) => EnglishSlokPage(),
        MyRoutes.slockPage: (context) => SlokPage(),
        MyRoutes.settingPage: (context) => SettingPage(),
        MyRoutes.favourite: (context) => EnglishFavouritePage(),
        MyRoutes.splashSceen: (context) => SplashScreen(),
        MyRoutes.hindifavourite: (context) => FavouritePage(),
      },
    );
  }
}
