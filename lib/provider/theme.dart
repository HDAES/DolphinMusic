// 主题状态管理

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeState  with ChangeNotifier {
  List<Color> themeColors=[
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.pink
  ];
  ThemeState(this.themeKey);

  int themeKey=0;

  void changeThemeColor(int key) async{
   
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeColor', key);
    
    themeKey=key;
    notifyListeners();
  }

  //获取本地保存的颜色
  getLocalThemeColor(needNotify) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('themeColor')!=null){
      print(prefs.getInt('themeColor'));
      themeKey=prefs.getInt('themeColor');
    }
    if (needNotify) {
      notifyListeners();
    }

  }
}