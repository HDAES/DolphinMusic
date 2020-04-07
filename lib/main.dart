import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeState ts;
    if(prefs.getInt('themeColor')!=null){
      ts = ThemeState(prefs.getInt('themeColor'));
    } else {
      ts = ThemeState(0);
    }
  runApp(
     MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=> ts)
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
            builder: (context, themeState, child){
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: themeState.themeColors[themeState.themeKey],
                ),
                home: Scaffold(
                  appBar: AppBar(title: Text('123123')),
                  body: Container(
                    alignment: Alignment.center,
                    child: Column(children: <Widget>[
                      GestureDetector(
                        onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(1);},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('黄色'),
                          color:  Colors.yellow,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(2);},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('红色'),
                          color: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){ Provider.of<ThemeState>(context, listen: false).changeThemeColor(3);},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('粉色'),
                          color: Colors.pink,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){ Provider.of<ThemeState>(context, listen: false).getLocalThemeColor(true);},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('获取本地colors')
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
              );
            },
          );
   
     
  }
}

