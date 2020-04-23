import 'package:flutter/material.dart';
import 'index/index_header.dart';
import './dynamic/dynamic_index.dart';
import './find/find_index_page.dart';
import './me/me_index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

   List<Widget> pageViewItem=[
     FindIndex(),MeIndex(),DynamicIndex()
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top:0,
              left: 0,
              right: 0,
              child: IndesHeader(),
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              child:  PageView.builder(
                itemCount: pageViewItem.length,
                itemBuilder:(context,index){
                  return pageViewItem[index];
                }
              )
            )
          ],
        )
      ),
    );
  }
}