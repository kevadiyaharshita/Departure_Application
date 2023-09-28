import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Json_Helper.dart';

class LikeController extends ChangeNotifier {
  List<Map> _liked = [];
  late SharedPreferences preferences;
  List<String> meaning = [];
  List<String> text = [];

  LikeController({required this.preferences});

  initLiked() {
    _liked.clear();
    meaning = preferences.getStringList('hindimeaning') ?? [];
    text = preferences.getStringList('text') ?? [];
    print('${meaning}');
    // for (int i = 0; i < 1; i++) {
    for (int j = 1;
        j <= JsonGeetaHelper.jesongeetahelper.adhyay[0]['verses_count'];
        j++) {
      // log('j[$i][$j]');

      // log('${JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyayWiseverses[0]['${j}']['meaning']}');
      if (meaning.contains(JsonGeetaHelper.jesongeetahelper.adhyayWiseverses[0]
          ['$j']['meaning'])) {
        _liked.add(JsonGeetaHelper.jesongeetahelper.adhyayWiseverses[0]['$j']);
        // break;
      }
    }
    // }
  }

  addLikeSlok({required Map m}) {
    initLiked();
    if (_liked.contains(m)) {
      _liked.remove(m);
      meaning.remove(m['meaning']);
      text.remove(m['text']);
      preferences.setStringList('hindimeaning', meaning);
      preferences.setStringList('text', text);
    } else {
      meaning.add(m['meaning']);
      text.add(m['text']);
      preferences.setStringList('hindimeaning', meaning);
      preferences.setStringList('text', text);
      _liked.add(m);
    }
    notifyListeners();
  }

  get getLike {
    initLiked();
    return _liked;
  }
}

// if (meaning.contains(JsonEnglishGeetaHelper
//     .jesonenglishgeetahelper.adhyayWiseverses[i]['$j']['meaing'])) {
// _liked.add(JsonEnglishGeetaHelper
//     .jesonenglishgeetahelper.adhyayWiseverses[i]['$j']);
// }
