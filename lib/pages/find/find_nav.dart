/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-19 15:04:44
 * @LastEditTime: 2020-06-19 15:40:10
 */ 
import 'package:dolphin_music/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/theme.dart';
import '../../p.dart';

class FindNav extends StatelessWidget {

  final List<Map> nav=[
    {"id":1,'icon':P.icon_daily,'name':'每日推荐'},
    {"id":2,'icon':P.icon_playlist,'name':'歌单'},
    {"id":3,'icon':P.icon_rank,'name':'排行榜'},
    {"id":4,'icon':P.icon_radio,'name':'电台'},
    {"id":5,'icon':P.icon_look,'name':'直播'},
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, themeState, child){
        return Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: nav.map((item){
              return GestureDetector(
                onTap: (){ toPage(item,context);},
                child: Container(
                  margin: EdgeInsets.only(top:15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom:5),
                        child: Image.asset(
                          item['icon'],
                          width: 50,
                          height: 50,
                        ),
                        decoration: BoxDecoration(
                          color: themeState.themeColors[themeState.themeKey],
                          borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      Text(item['name'])
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      });
  }

  void toPage(Map item,context){
    print(item);
    switch(item['id']){
      case 3 :
        Application.router.navigateTo(context, '/rank');
    }
  }
  
}