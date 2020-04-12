import 'package:flutter/material.dart';
import '../../utils/net_req.dart';
import '../../model/banner.dart';
import '../../model/recommended.dart';
import 'find_Recommended_playlist.dart';
import 'find_banner.dart';
import 'find_nav.dart';
class FindIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBanner(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return ListView(
            padding: EdgeInsets.only(left:10,right:10),
            children: <Widget>[
              FindBanner(banner:snapshot.data['banner']),
              FindNav(),
              FindRecommenderPlayList(recommended: snapshot.data['recommended'],)
            ],
          );
        }else{
          return Text('loging');
        }
        
      },
    );  
  }

  Future getBanner() async{
    BannerModel banner = await NetReq.banner();
    Recommended recommended = await NetReq.recommended();
    Map res ={
      'banner':banner,
      'recommended':recommended
    };
    return res;
  }
  
}