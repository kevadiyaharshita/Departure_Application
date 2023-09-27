import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/Theme_Controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    int theme_index = Provider.of<ThemeController>(context).getTheme ? 1 : 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text("Theme"),
              subtitle: Text("Change Theme"),
              leading: Icon(
                CupertinoIcons.sun_min_fill,
                size: 30,
              ),
              trailing: Consumer<ThemeController>(
                builder: (context, pro, _) {
                  return CupertinoSlidingSegmentedControl(
                    children: {
                      0: Icon(CupertinoIcons.sun_min),
                      1: Icon(CupertinoIcons.moon_fill),
                    },
                    groupValue: theme_index,
                    // thumbColor: CupertinoColors.white,
                    onValueChanged: (index) {
                      theme_index = index!;
                      pro.changeTheme();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
