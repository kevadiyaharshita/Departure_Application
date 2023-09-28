import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonGeetaHelper {
  JsonGeetaHelper._();
  static final JsonGeetaHelper jesongeetahelper = JsonGeetaHelper._();
  List<Map> adhyay = [];
  List<Map> adhyayWiseverses = [];

  Future<List> getHindiAdhyayData() async {
    String data = await rootBundle.loadString('assets/JSON/dataset_hindi.json');
    List jsonHindiAdhay = jsonDecode(data);
    log('json DATA : ${jsonHindiAdhay.runtimeType}');

    Map obj = jsonHindiAdhay[0]['chapters'];
    for (int i = 1; i < 19; i++) {
      String key = i.toString();
      Map obj1 = obj['$i'];
      adhyay.add(obj1);
    }

    Map verses = jsonHindiAdhay[0]['verses'];
    for (int i = 1; i < 19; i++) {
      Map obj1 = verses["$i"];
      adhyayWiseverses.add(obj1);
      // print("Veses of ${adhyayWiseverses[i - 1]['$i']['text']}");
      // print("Heloo");
    }
    return adhyay;
  }
  //
  // Future<List> getEnglishAdhyayData() async {
  //   String data =
  //       await rootBundle.loadString('assets/JSON/dataset_english.json');
  //   List jsonHindiAdhay = jsonDecode(data);
  //   log('json DATA : ${jsonHindiAdhay.runtimeType}');
  //
  //   Map obj = jsonHindiAdhay[0]['chapters'];
  //   for (int i = 1; i < 19; i++) {
  //     String key = i.toString();
  //     Map obj1 = obj['$i'];
  //     Adhyay.add(obj1);
  //   }
  //   return Adhyay;
  // }

  get getChpter {
    return adhyay;
  }
}

class JsonEnglishGeetaHelper {
  JsonEnglishGeetaHelper._();
  static final JsonEnglishGeetaHelper jesonenglishgeetahelper =
      JsonEnglishGeetaHelper._();
  List<Map> adhyay = [];
  List<Map> adhyayWiseverses = [];

  Future<List> getEnglishAdhyayData() async {
    String data =
        await rootBundle.loadString('assets/JSON/dataset_english.json');
    List jsonEnglishAdhay = jsonDecode(data);
    log('json DATA : ${jsonEnglishAdhay.runtimeType}');

    Map obj = jsonEnglishAdhay[0]['chapters'];
    for (int i = 1; i < 19; i++) {
      String key = i.toString();
      Map obj1 = obj['$i'];
      adhyay.add(obj1);
    }

    Map verses = jsonEnglishAdhay[0]['verses'];
    for (int i = 1; i < 19; i++) {
      Map obj1 = verses['$i'];
      adhyayWiseverses.add(obj1);
      // print("Adyay : $i");
      // print('${adhyayWiseverses[i - 1]["$i"]['text']}');
      // adhyayWiseverses[i - 1]["$i"]['text'];
    }

    return adhyay;
  }
}

// class JsonHelper {
//   JsonHelper._();
//   static final JsonHelper jesonhelper = JsonHelper._();
//
//   Future<List> getData() async {
//     String data = await rootBundle.loadString('assets/JSON/data.json');
//     List jsonData = jsonDecode(data);
//     log('DATA : ${jsonData.runtimeType}');
//     return jsonData;
//   }
// }
