import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/login_page.dart';
import '../pages/index_page.dart';
import '../pages/rank_page/rank_page.dart';

//登录页面
Handler loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return LoginPage();
  }
);

// 首页
Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return IndexPage();
  }
);

// 排行
Handler rankHandler = Handler(
  handlerFunc: (BuildContext context, Map<String,List<String>> params){
    return RankPage();
  }
);
