import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String loginPage = '/login'; // 登录页面
 
  static void configRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
        return ;
      }
    );
    
    router.define(loginPage, handler: loginHandler);
  }
}
