import 'package:dolphin_music/public/common.dart';
import 'package:dolphin_music/routers/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme.dart';
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
          ),
          Positioned(
            bottom: 80,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(0);},
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(1);},
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(2);},
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
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

// 输入文本
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    //print(Provider.of<ThemeState>(context, listen: false).themeKey);
    return Consumer<ThemeState>(
      builder: (context, themeState, child){
        Color themeColor = themeState.themeColors[themeState.themeKey];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Welcome Back',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: themeColor)),
            Text('The Flutter Dolphin Music',style: TextStyle(fontSize: 16,color: themeColor,fontWeight: FontWeight.w400)),
            Theme(
              data: ThemeData(hintColor: themeColor,primaryColor: themeColor),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top:20,bottom:20),
                    child: TextField(
                      controller: phoneController,
                      style: TextStyle(color: themeColor),
                      keyboardType: TextInputType.number,
                      inputFormatters:phoneFormate,
                      decoration:InputDecoration(
                        hintText: 'Phone',
                        prefixIcon: Icon(Icons.phone_iphone,color: themeColor),
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: themeColor),   
                        ),
                      )
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(color: themeColor),
                      obscureText: true,//是否是密码
                      decoration:InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock,color: themeColor),
                        enabledBorder: UnderlineInputBorder(      
                          borderSide: BorderSide(color: themeColor),   
                        ),
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap: (){login();},
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.all(12),
                      width: ScreenUtil().setWidth(600),
                      child: Text('Login',style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]
        );
      }
    );
  }

  void  login(){
    Application.router.navigateTo(context, '/index');
    // print(passwordController.text);
    // NetReq.login(context,phoneController.text,passwordController.text);
  }
}



