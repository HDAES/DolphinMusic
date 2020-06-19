/*
 * @Descripttion: 
 * @Author: Hades
 * @Date: 2020-06-19 15:23:43
 * @LastEditTime: 2020-06-19 17:33:50
 */ 

import 'package:flutter/material.dart';
import '../../utils/net_action.dart';
import '../../model/rankList.dart';
class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
      ),
      body: FutureBuilder(
        future: getRankList(context),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            List<Widget> tiles=[];
            snapshot.data['rankList'].toJson()['list'].getRange(0,4).forEach((item) {
              tiles.add(_item(item));
            });
            return ListView(
              padding: EdgeInsets.only(left:20,right:20),
              children: <Widget>[
                Text('官方榜'),
                Column(
                  children: tiles,
                )      
              ],
            );
          }else{
            return Text('loading');
          }
        }
      ),
    );
  }

  //排行榜Item
  Widget _item(item){
    return Container(
        margin: EdgeInsets.only(top:20),
        child: Row(
          children: <Widget>[
            Image.network(
              item['coverImgUrl'],
              width: 100,
              height: 100,
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: map<Widget>(item['tracks'],(index,data){
                  return GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: <Widget>[
                        Text('${index+1}.'),
                        Text(data['first']),
                        Padding(padding: EdgeInsets.only(left:5,right:5),child: Text('-'),),
                        Text(data['second'])
                      ],
                    ),
                  );
                })
              ),
            )  
          ],
        ),
    );
  }

  Future getRankList(context) async{
    RankListModel rankList =  await NetAction.getRankList();
    Map res ={
      'rankList':rankList,
    };
    return res;
  }

  List<T> map<T>(List list,Function handler){
    List<T> result = [];
    for(var i=0;i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }
}