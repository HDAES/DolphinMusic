import 'package:dolphin_music/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../model/banner.dart';
import '../model/recommended.dart';

class NetReq{
  static Dio _dio;
  static final String baseUrl = 'http://music.xl686.com';

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,}
  ) async {
    if (isShowLoading) Loading.showLoading(context);
    try{
      return await _dio.get(baseUrl+url, queryParameters: params);
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
        Dio dio = new Dio();
       await dio.get('http://music.xl686.com/login/cellphone?phone=19942326969&password=1005710179');
  }

  // 获取轮播图
  static Future banner() async {
    Dio dio = new Dio();
    var response=await dio.get(baseUrl+'/banner?type=2');
    return BannerModel.fromJson(response.data);
  }

  // 获取推荐歌单
  static Future recommended() async {
    Dio dio = new Dio();
    var response=await dio.get(baseUrl+'/personalized?limit=5');
    return Recommended.fromJson(response.data);
  }
}