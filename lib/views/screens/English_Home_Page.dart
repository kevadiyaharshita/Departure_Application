import 'dart:developer';
import 'dart:ui';

import 'package:departure_application/controller/Json_Helper.dart';
import 'package:departure_application/controller/Language_Controller.dart';
import 'package:departure_application/controller/Theme_Controller.dart';
import 'package:departure_application/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/image_utils.dart';

class EnglishHomePage extends StatelessWidget {
  const EnglishHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/750x/3c/4d/14/3c4d14bbe29c31b13090aa0361a88dc2.jpg'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Provider.of<ThemeController>(context).getTheme
              ? Colors.black54.withOpacity(0.5)
              : Colors.white.withOpacity(0.5),
          title: Text(
            "|| Bhagvat Gita ||",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              log("Tappade.....");
              Navigator.of(context).pushNamed(MyRoutes.favourite);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.settingPage);
              },
              icon: Icon(
                Icons.settings,
                // size: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: FutureBuilder(
            future: JsonEnglishGeetaHelper.jesonenglishgeetahelper
                .getEnglishAdhyayData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            MyRoutes.english_slok_Page,
                            arguments: index);
                      },
                      child: Container(
                        height: 300,
                        width: w,
                        margin: EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          color: Provider.of<ThemeController>(context,
                                      listen: false)
                                  .getTheme
                              ? Colors.black.withOpacity(0.2)
                              : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          border: Border.all(
                            width: 3,
                            color: Provider.of<ThemeController>(context,
                                        listen: false)
                                    .getTheme
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(26),
                                bottomRight: Radius.circular(26),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY: 2,
                                ),
                                child: Container(
                                  width: w,
                                  height: 300,
                                  color: Provider.of<ThemeController>(context,
                                              listen: false)
                                          .getTheme
                                      ? Colors.black.withOpacity(0.1)
                                      : Colors.white.withOpacity(0.1),
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 165,
                                    width: 165,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            images[index],
                                            // 'https://i.pinimg.com/564x/c3/1d/db/c31ddb97e861a659766a8bb06eaf74af.jpg',
                                          ),
                                          fit: BoxFit.fill),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.black54.withOpacity(0.5),
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                        BoxShadow(
                                          color:
                                              Colors.black54.withOpacity(0.5),
                                          offset: Offset(-2, -2),
                                          blurRadius: 5,
                                        )
                                      ],
                                      border: Border.all(
                                        width: 3,
                                        color: Provider.of<ThemeController>(
                                                    context,
                                                    listen: false)
                                                .getTheme
                                            ? Colors.white.withOpacity(0.5)
                                            : Colors.black54.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "-------------------- || Chapter: ${index + 1} || -------------------- ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Provider.of<ThemeController>(
                                                  context,
                                                  listen: false)
                                              .getTheme
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    ' || ${snapshot.data![index]['name']} ||',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Provider.of<ThemeController>(
                                                  context,
                                                  listen: false)
                                              .getTheme
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
