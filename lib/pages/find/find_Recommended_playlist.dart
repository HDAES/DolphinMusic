import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/recommended.dart';

class FindRecommenderPlayList extends StatefulWidget {
  final Recommended recommended;
  FindRecommenderPlayList({this.recommended});
  @override
  _FindRecommenderPlayListState createState() => _FindRecommenderPlayListState();
}

class _FindRecommenderPlayListState extends State<FindRecommenderPlayList> {
  @override
  Widget build(BuildContext context) {
    print(widget.recommended.toJson()['result'][0]);
    return Container(
      margin: EdgeInsets.only(top:10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('推荐歌单'),
          Container(
            margin: EdgeInsets.only(top:10),
            height: ScreenUtil().setWidth(280),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext content, int index){
                return _item(widget.recommended.toJson()['result'][index]);
              },
              itemCount: widget.recommended.toJson()['result'].length,
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
            bottom: 0,
            height:ScreenUtil().setWidth(80),
            width: ScreenUtil().setWidth(220),
            child: Text(
              item['name'],
              style: TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap:true
            ),
          ),
          Positioned(
            top:0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.play_circle_outline,color: Colors.white,size: 14),
                Text(
                  "${(item['playCount']%1000).toString()}万",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                )
              ],
            )
          )
        ],
      ),
    ),
  );
}

}