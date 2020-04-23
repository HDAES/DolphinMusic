import 'package:dolphin_music/pages/find/find_recommend_music.dart';
import 'package:dolphin_music/pages/find/find_recommend_mv.dart';
import 'package:dolphin_music/utils/net_action.dart';
import 'package:flutter/material.dart';
import '../../model/banner.dart';
import '../../model/recommended.dart';
import '../../model/recommendmusic.dart';
import '../../model/recommend_mv.dart';
import 'find_recommended_playlist.dart';
import 'find_banner.dart';
import 'find_nav.dart';
class FindIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBanner(context),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return ListView(
            children: <Widget>[
              FindBanner(banner:snapshot.data['banner']),
              FindNav(),
              FindRecommenderPlayList(recommended: snapshot.data['recommended']),
              FindRecommendMusic(recommendMusic:snapshot.data['recommendmusic']),
              FindRecommendMv(recommendmv: snapshot.data['recommendmv'])
            ],
          );
        }else{
          return Text('loging');
        }
        
      },
    );  
  }

  Future getBanner(context) async{
    BannerModel banner =  await NetAction.getBanner();
    RecommendedModel recommended = await NetAction.getrecommended();
    RecommendMusicModel recommendmusic= await NetAction.getrecommendMusic();
    RecommendMvModel recommendmv = await NetAction.getrecommendMv();
    
    Map res ={
      'banner':banner,
      'recommended':recommended,
      'recommendmusic':recommendmusic,
      'recommendmv':recommendmv
    };
    return res;
  }
  
}