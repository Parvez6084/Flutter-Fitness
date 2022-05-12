import 'package:easy_localization/src/public_ext.dart';
import 'package:fitness_checker/consts/app_strings.dart';
import 'package:flutter/cupertino.dart';

class SettingsProvider with ChangeNotifier{

  bool isEnglish = false;

  void updateLanguage(BuildContext context,bool isEnglish){
    if(isEnglish){
      isEnglish = true;
      context.locale = AppStrings.english;
    }else{
      isEnglish = false;
      context.locale = AppStrings.bengali;
    }
    notifyListeners();
  }
}