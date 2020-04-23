import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/recommend_mv.dart';

class FindRecommendMv extends StatefulWidget {
  final RecommendMvModel recommendmv;
  FindRecommendMv({this.recommendmv});
  @override
  _FindRecommendMvState createState() => _FindRecommendMvState();
}

class _FindRecommendMvState extends State<FindRecommendMv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10,left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text('推荐Mv',style: TextStyle(fontWeight: FontWeight.bold)),
        ]+widget.recommendmv.result.map((item){ 
          return  GestureDetector(
            onTap: (){},
            child: Container(
              width: ScreenUtil().setWidth(750),
              margin: EdgeInsets.only(top:15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(item.picUrl),
                        fit: BoxFit.fitWidth,
                      )
                    ),
                  ),
                  Text(item.name)
                ],
              ),
              
            ),
          );
        }).toList(),
      ),
    );
  }
  
}