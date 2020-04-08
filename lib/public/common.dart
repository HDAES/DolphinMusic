import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/theme.dart';
import '../p.dart';



//电话输入格式
List<TextInputFormatter> phoneFormate = <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(11)];



//构建统一电话号码输入框
Widget phone(TextEditingController phoneController,) {
  print(ThemeState().themeKey);
  return TextField(
    controller: phoneController,
    style: TextStyle(color: ThemeState().themeColors[0]),
    keyboardType: TextInputType.number,
    
    inputFormatters:phoneFormate,
    decoration: InputDecoration(
    ),
  );
}
