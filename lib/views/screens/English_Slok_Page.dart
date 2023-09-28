import 'dart:math';
import 'dart:ui';

import 'package:departure_application/controller/Json_Helper.dart';
import 'package:departure_application/controller/English_Like_Contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../controller/Theme_Controller.dart';

class EnglishSlokPage extends StatelessWidget {
  const EnglishSlokPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/564x/b5/2e/44/b52e44625cef669cf5dc3762727f5e9a.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("|| Chapter : ${index + 1} ||"),
          centerTitle: true,
          backgroundColor: Provider.of<ThemeController>(context).getTheme
              ? Colors.black54.withOpacity(0.5)
              : Colors.white.withOpacity(0.5),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyay[index]
                    ['verses_count'],
                (idx) {
                  return Container(
                    height: 570,
                    width: 500,
                    margin: EdgeInsets.only(top: 18),
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          Provider.of<ThemeController>(context, listen: false)
                                  .getTheme
                              ? Colors.black.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      border: Border.all(
                        width: 3,
                        color:
                            Provider.of<ThemeController>(context, listen: false)
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
                              height: 570,
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
                            children: [
                              Text(
                                "~: Verse ${idx + 1}:~",
                                style: TextStyle(fontSize: 22),
                              ),
                              Gap(20),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "${JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyayWiseverses[index]['${idx + 1}']['transliteration']}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Provider.of<ThemeController>(context,
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
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyayWiseverses[index]['${idx + 1}']['meaning']}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Provider.of<ThemeController>(context,
                                                listen: false)
                                            .getTheme
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Consumer<EnglishLikeController>(
                                  builder: (context, provider, _) {
                                return IconButton(
                                  onPressed: () {
                                    provider.addLikeSlok(
                                        m: JsonEnglishGeetaHelper
                                                .jesonenglishgeetahelper
                                                .adhyayWiseverses[index]
                                            ['${idx + 1}']);
                                  },
                                  icon: Icon(
                                    (provider.getLike.contains(
                                            JsonEnglishGeetaHelper
                                                    .jesonenglishgeetahelper
                                                    .adhyayWiseverses[index]
                                                ['${idx + 1}']))
                                        ? CupertinoIcons.heart_solid
                                        : CupertinoIcons.heart,
                                    size: 30,
                                  ),
                                );
                              }),
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
        ),
      ),
    );
  }
}

// Container(
// height: 300,
// width: 500,
// color: Colors.pink,
// child: Text(
// "${JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyayWiseverses[index]['1']['text']}"),
// ),
