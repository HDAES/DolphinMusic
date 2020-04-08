import 'package:dolphin_music/public/common.dart';
import 'package:dolphin_music/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../p.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this
    );
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return StaggerAnimation(
          controller: _controller
      );
  }
}

//构建动画
class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({ Key key, this.controller }): super(key: key){
    //图片大小
    imageZoom = Tween<double>(begin:.0 ,end: 150.0,).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
    //图片透明度
    imageopacity = Tween<double>(begin:1 ,end: 0,).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 0.8, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
    //登录框透明度
    loginopacity = Tween<double>(begin:0 ,end: 1,).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
    //距离顶部距离
    logintop = Tween<double>(begin:150 ,end: 50,).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }


  final Animation<double> controller;
  Animation<double> imageZoom;
  Animation<double> imageopacity;
  Animation<double> loginopacity;
  Animation<double> logintop;
  
  Widget _buildAnimation(BuildContext context, Widget child) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Center(
            child:Opacity(
              opacity: imageopacity.value,
              child: Image.asset(
                P.icon_logo,
                width: imageZoom.value,
                height: imageZoom.value,
              ),
            )  
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            padding: EdgeInsets.only(top:logintop.value),
            child: Opacity(
              opacity: loginopacity.value,
              child: LoginWidget(),
            ) 
            
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Welcome Back',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        Text('The Flutter Dolphin Music',style: TextStyle(fontSize: 16,color: Colors.black38,fontWeight: FontWeight.w400)),
        phone(phoneController)
      ]
    );
  }
}



