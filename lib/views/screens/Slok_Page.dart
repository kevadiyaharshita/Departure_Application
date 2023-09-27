import 'package:flutter/material.dart';

import '../../controller/Json_Helper.dart';

class SlokPage extends StatelessWidget {
  const SlokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
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
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index]['name']),
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
    );
  }
}
