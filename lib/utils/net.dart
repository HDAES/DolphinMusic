/*
 * @Descripttion:  对请求的封装
 * @Author: Hades
 * @Date: 2020-04-15 18:31:30
 * @LastEditTime: 2020-04-23 13:41:25
 */

import 'package:dolphin_music/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class MyNet{
  static String testUrl='http://music.xl686.com';
  static bool isLogin=false;
  static String token;

  /// 调取方法，获取登录状态
  static void getLoginState() async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String userInfo=prefs.getString('userInfo');
    // String localToken=prefs.getString('token');
    // print(localToken);
    // if(userInfo!=''&&localToken!=''){
    //   isLogin=true;
    //   //dio.options.headers=_buildHeaders();
    //   print('登录中');
    // }else{
    //   isLogin=false;
    //   print('未登录');
    // }
  }


  ///设置token和userinfo
  static void setLoginState(bool newisLogin,String newtoken) async{
    //print(newtoken);
    isLogin=newisLogin;
    token=newtoken;
    //dio.options.headers=_buildHeaders();
    
    
  }

   

  static Dio dio = new Dio(
    new BaseOptions(
      baseUrl: testUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
    )
  );

  /// 构建头部
  static _buildHeaders() {
    Map<String, dynamic> result;
    if (isLogin) {
      result = {'Authorization': "Bearer $token"};
    } else {
      result = Map<String, dynamic>();
    }
    return result;
  }


  static get(String url) async{
   
    try{
      Response response = await dio.get(url);
      if(response.statusCode==200){
        return response.data;
      }else{
        return null;
      }
    } on DioError catch(e){
      print(e.response.statusCode);
      _formatError(e);
    }
    
  }

  static post(String url,Map<String,dynamic> params) async{
    try{
      Response response = await dio.post(url,data: params);
      //print('post😄😄😄😄😄😄:  $response');
      if(response.statusCode==200){
        return response.data;
      }else{
        return false;
      }
    } on DioError catch(e){
      print(e.response.statusCode);
      _formatError(e);
    }
  }

}

/*
   * error统一处理
   */
  void _formatError(DioError e) {
    if (e.response != null) {
      if (e.response.statusCode == 400) {
        Toast.show('登录失效，请重新登录');
        //Global.instance.loginOut();
//        Global.instance.pushNamed(LoginPage.route);
        return;
      } else if (e.response.statusCode == 404) {
        Toast.show('页面没有找到');
        return;
      } else if (e.response.statusCode == 500) {
        Toast.show('服务器开小差了[500]');
        return;
      }
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      Toast.show("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      Toast.show("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Toast.show("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      Toast.show("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      Toast.show("请求取消");
    } else {
      Toast.show("未知错误" + e.type.toString());
    }
  }