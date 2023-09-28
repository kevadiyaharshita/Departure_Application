import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Json_Helper.dart';

class EnglishLikeController extends ChangeNotifier {
  List<Map> _liked = [];
  late SharedPreferences preferences;
  List<String> meaning = [];
  List<String> transliteration = [];

  EnglishLikeController({required this.preferences});

  initLiked() {
    _liked.clear();
    meaning = preferences.getStringList('meaning') ?? [];
    transliteration = preferences.getStringList('transliteration') ?? [];
    print('${meaning}');
    // for (int i = 0; i < 1; i++) {
    for (int j = 1;
        j <=
            JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyay[0]
                ['verses_count'];
        j++) {
      // log('j[$i][$j]');

      // log('${JsonEnglishGeetaHelper.jesonenglishgeetahelper.adhyayWiseverses[0]['${j}']['meaning']}');
      if (meaning.contains(JsonEnglishGeetaHelper
          .jesonenglishgeetahelper.adhyayWiseverses[0]['$j']['meaning'])) {
        _liked.add(JsonEnglishGeetaHelper
            .jesonenglishgeetahelper.adhyayWiseverses[0]['$j']);
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
      transliteration.remove(m['transliteration']);
      preferences.setStringList('meaning', meaning);
      preferences.setStringList('transliteration', transliteration);
    } else {
      meaning.add(m['meaning']);
      transliteration.add(m['transliteration']);
      preferences.setStringList('meaning', meaning);
      preferences.setStringList('transliteration', transliteration);
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
