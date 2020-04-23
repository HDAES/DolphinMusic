import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/recommendmusic.dart';

class FindRecommendMusic extends StatefulWidget {
  final RecommendMusicModel recommendMusic;
  FindRecommendMusic({this.recommendMusic});
  @override
  _FindRecommendMusicState createState() => _FindRecommendMusicState();
}

class _FindRecommendMusicState extends State<FindRecommendMusic> {
 @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10,left: 10,right: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('推荐歌曲',style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.only(top:10),
            height: ScreenUtil().setWidth(280),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext content, int index){
                return _item(widget.recommendMusic.toJson()['result'][index]);
              },
              itemCount: widget.recommendMusic.toJson()['result'].length,
            )
          )
        ],
      ),
    );
  }

Widget _item(item){
  return GestureDetector(
    onTap: (){},
    child: Container(
      width: ScreenUtil().setWidth(200),
      margin: EdgeInsets.only(right:10),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setWidth(200),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage("${item['picUrl']}"),
                fit: BoxFit.fitHeight,
              )
            ),
          ),
          Positioned(
            bottom: ScreenUtil().setWidth(40),
            height:ScreenUtil().setWidth(40),
            width: ScreenUtil().setWidth(220),
            child: Text(
              item['song']['artists'][0]['name'],
              style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap:true
            ),
          ),
          Positioned(
            bottom: 0,
            height:ScreenUtil().setWidth(40),
            width: ScreenUtil().setWidth(220),
            child: Text(
              item['name'],
              style: TextStyle(fontSize: 11,color: Colors.black87),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap:true
            ),
          ),
        ],
      ),
    ),
  );
}

}