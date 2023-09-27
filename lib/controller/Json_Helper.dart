import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class JsonGeetaHelper {
  JsonGeetaHelper._();
  static final JsonGeetaHelper jesongeetahelper = JsonGeetaHelper._();
  List<Map> Adhyay = [];

  Future<List> getHindiAdhyayData() async {
    String data = await rootBundle.loadString('assets/JSON/dataset_hindi.json');
    List jsonHindiAdhay = jsonDecode(data);
    log('json DATA : ${jsonHindiAdhay.runtimeType}');

    Map obj = jsonHindiAdhay[0]['chapters'];
    for (int i = 1; i < 19; i++) {
      String key = i.toString();
      Map obj1 = obj['$i'];
      Adhyay.add(obj1);
    }
    return Adhyay;
  }

  get getChpter {
    return Adhyay;
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