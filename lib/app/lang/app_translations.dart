

import 'package:epaypodcoderwithgetx/app/lang/az_AZ/az_az_translations.dart';
import 'package:epaypodcoderwithgetx/app/lang/en_US/en_us_translations.dart';
import 'package:epaypodcoderwithgetx/app/lang/ru_RU/ru_ru_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'az_AZ': az_AZ,
    'en_EN': en_EN,
    'ru_RU': ru_RU,
  };
}