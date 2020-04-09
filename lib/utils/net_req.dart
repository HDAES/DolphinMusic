import 'package:dolphin_music/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NetReq{
  static Dio _dio;
  static final String baseUrl = 'http://music.xl686.com/';

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,}
  ) async {
    if (isShowLoading) Loading.showLoading(context);
    try{
      return await _dio.get(url, queryParameters: params);
    }catch(e){
      if(e ==null){
        return Future.error(Response(data: -1));
      }else if(e.response != null){
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      }else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

   /// 登录
  static Future login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login/cellphone', params: {
      'phone': phone,
      'password': password,
    });

    print(response);
    return response;
  }
}