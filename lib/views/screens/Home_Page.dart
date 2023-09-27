import 'dart:ui';

import 'package:departure_application/controller/Json_Helper.dart';
import 'package:departure_application/controller/Theme_Controller.dart';
import 'package:departure_application/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            image: AssetImage('assets/images/backGroundImageHomePage.jpg'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Provider.of<ThemeController>(context).getTheme
              ? Colors.black54.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          title: Text(
            "|| श्रीमद्भगवद्गीता ||",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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
          padding: EdgeInsets.all(18),
          child: FutureBuilder(
            future: JsonGeetaHelper.jesongeetahelper.getHindiAdhyayData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      width: w,
                      margin: EdgeInsets.only(bottom: 18),
                      decoration: BoxDecoration(
                        // color: Colors.pink,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        border: Border.all(
                          width: 4,
                          color: Provider.of<ThemeController>(context,
                                      listen: false)
                                  .getTheme
                              ? Colors.white.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 165,
                                  width: 165,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://i.pinimg.com/564x/c3/1d/db/c31ddb97e861a659766a8bb06eaf74af.jpg'),
                                        fit: BoxFit.fill),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.5),
                                        offset: Offset(2, 2),
                                        blurRadius: 5,
                                      ),
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.5),
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
                                          ? Colors.white.withOpacity(0.8)
                                          : Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Text(
                                  "-------------------- || अध्याय: ${index + 1} || -------------------- ",
                                  style: TextStyle(
                                    color: Provider.of<ThemeController>(context,
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
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

//==========================================
// child: FutureBuilder(
//   future: JsonHelper.jesonhelper.getData(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return ListView.builder(
//         itemCount: snapshot.data!.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(snapshot.data![index]['title']),
//             ),
//           );
//         },
//       );
//     } else {
//       return CircularProgressIndicator();
//     }
//   },
// ),
