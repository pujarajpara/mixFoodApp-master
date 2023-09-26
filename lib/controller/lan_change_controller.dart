



import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Constants/model.dart';
import 'package:mixfoodapp/Page/persondetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/model.dart';
import '../Constants/model.dart';


class LanguageChangeControllerProvider with ChangeNotifier{



  Locale? _appLocale;
  Locale? get appLocale=>_appLocale;
  Future<void> changeLanguage(Locale type)async{
    final sp=await SharedPreferences.getInstance();
    _appLocale=type;
    if(type==const Locale('en')){
      await sp.setString('language_code','en');
    }
    else if(type==Locale('hi')){
      await sp.setString('language_code','hi');

    }
    else
      {
        await sp.setString('language_code', 'gu');
      }
    notifyListeners();
  }

}