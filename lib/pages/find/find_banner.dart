import 'package:flutter/material.dart';
import '../../model/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class FindBanner extends StatefulWidget {
  final BannerModel banner;
  FindBanner({this.banner});
  @override
  _FindBannerState createState() => _FindBannerState();
}

class _FindBannerState extends State<FindBanner> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(330),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext content, int index){
          return Container(
            margin: EdgeInsets.only(left:10,right:10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage("${widget.banner.toJson()['banners'][index]['pic']}"),
                fit: BoxFit.fitHeight,
              )
            ),
          );
        },
        itemCount: widget.banner.toJson()['banners'].length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
      
    );
  }
}