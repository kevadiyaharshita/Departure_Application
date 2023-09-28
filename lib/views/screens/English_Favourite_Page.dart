import 'dart:ui';

import 'package:departure_application/controller/English_Like_Contoller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../controller/Theme_Controller.dart';

class EnglishFavouritePage extends StatelessWidget {
  const EnglishFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/29/5d/6d/295d6d1ace54655f0663f111a366103c.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("|| Favourite ||"),
          centerTitle: true,
          backgroundColor: Provider.of<ThemeController>(context).getTheme
              ? Colors.black54.withOpacity(0.5)
              : Colors.white.withOpacity(0.5),
        ),
        body: Consumer<EnglishLikeController>(
          builder: (context, pro, _) {
            return Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    pro.getLike.length,
                    (index) {
                      return Container(
                        height: 500,
                        width: 500,
                        margin: EdgeInsets.only(top: 18),
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Provider.of<ThemeController>(context,
                                      listen: false)
                                  .getTheme
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
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
                                  height: 500,
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
                                children: [
                                  Text(
                                    "~: Verse :~",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Gap(20),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      "${pro.getLike[index]['transliteration']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Provider.of<ThemeController>(
                                                    context,
                                                    listen: false)
                                                .getTheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "~~~~~~~~~~~~~~~~~~~~~~~",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Text(
                                    "|| Meaning ||",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Gap(20),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      '${pro.getLike[index]['meaning']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 6,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Provider.of<ThemeController>(
                                                    context,
                                                    listen: false)
                                                .getTheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
