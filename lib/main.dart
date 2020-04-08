import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routers/routes.dart';
import './routers/application.dart';
import './provider/theme.dart';
import './pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeState ts;
    if(prefs.getInt('themeColor')!=null){
      ts = ThemeState(themeKey:  prefs.getInt('themeColor'));
    } else {
      ts = ThemeState(themeKey:0);
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
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return Consumer<ThemeState>(
      builder: (context, themeState, child){
        return MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: Application.router.generator,
          theme: ThemeData(
            primarySwatch: themeState.themeColors[themeState.themeKey],
          ),
          home: Scaffold(
            backgroundColor: themeState.backgroundColor,
            body: HomePage(),
          ),
        );
      },
    );
  }
}

