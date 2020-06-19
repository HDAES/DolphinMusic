/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-19 15:04:44
 * @LastEditTime: 2020-06-19 15:29:56
 */ 
import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String loginPage = '/login'; // 登录页面
  static String indexPage = '/index'; // 登录页面
  static String rankPage = '/rank';//排行榜
 
  static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return ;
      }
    );
    
    router.define(loginPage, handler: loginHandler);
    router.define(indexPage, handler: indexHandler);
    router.define(rankPage, handler: rankHandler);
  }
}
