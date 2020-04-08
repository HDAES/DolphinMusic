import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/login_page.dart';

//登录页面
Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return LoginPage();
  }
);
