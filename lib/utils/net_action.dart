/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-19 15:04:44
 * @LastEditTime: 2020-06-19 15:59:32
 */ 



import '../model/banner.dart';
import '../model/recommended.dart';
import '../model/recommendmusic.dart';
import '../model/recommend_mv.dart';
import '../model/rankList.dart';
import './net.dart';
import 'net.dart';



class ApiUrl {
  static String banner = '/banner?type=2'; /// 获取轮播图
  static String recommended = '/personalized?limit=5'; //获取推荐歌单
  static String recommendsong = '/personalized/newsong'; //获取推荐歌曲
  static String recommendmv = '/personalized/mv'; //获取推荐mv
  static String rankList = '/toplist/detail';//所有榜单
}

class NetAction {
  //轮播图
  static getBanner() async {
    Map response=await MyNet.get(ApiUrl.banner);
    return BannerModel.fromJson(response);
  }

  //获取推荐歌单
  static  getrecommended() async {
    Map response=await MyNet.get(ApiUrl.recommended);
    return RecommendedModel.fromJson(response);
  }

  //获取推荐歌曲
  static  getrecommendMusic() async {
    Map response=await MyNet.get(ApiUrl.recommendsong);
    return RecommendMusicModel.fromJson(response);
  }

  //获取推荐mv
  static  getrecommendMv() async {
    Map response=await MyNet.get(ApiUrl.recommendmv);
    return RecommendMvModel.fromJson(response);
  }

  static getRankList() async{
    Map response = await MyNet.get(ApiUrl.rankList);
    return RankListModel.fromJson(response);
  }
}






