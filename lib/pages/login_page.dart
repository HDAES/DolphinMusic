import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../p.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(80),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  P.icon_logo,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100),
                ),
              ),
              _LoginAnimatedWidget(
                animation: _animation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _LoginWidget extends StatefulWidget {
  @override
  __LoginWidgetState createState() => __LoginWidgetState();
}

class __LoginWidgetState extends State<_LoginWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 34,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(3)),
            child: Text(
              'The Flutter Netease Cloud Music App',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: 'Phone',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.grey,
                )),
          ),
          TextField(
            obscureText: true,
            controller: _pwdController,
            decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
    );
  }
}

class _LoginAnimatedWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  _LoginAnimatedWidget({
    @required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: _LoginWidget(),
      ),
    );
  }
}