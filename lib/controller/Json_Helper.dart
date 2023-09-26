import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  JsonHelper._();
  static final JsonHelper jesonhelper = JsonHelper._();

  Future<List> getData() async {
    String data = await rootBundle.loadString('assets/JSON/data.json');
    List jsonData = jsonDecode(data);
    log('DATA : ${jsonData.runtimeType}');
    return jsonData;
  }
}
