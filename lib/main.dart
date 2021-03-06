import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/LogIn/welcome.dart';
import 'package:shopping_list/Utils/assetsImages.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Utils/TextApp.dart';
import 'Utils/constantsApp.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff554fff),
        primaryColorDark: Color(0xff0024cb),
        primaryColorLight: Color(0xff937cff),
        accentColor: Color(0xffedecee),
        //backgroundColor: Color(0xffffffff),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  static const String TAG = "main";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: _initializationFirebase,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                developer.log(TAG + ", Firebase init. ERROR");
                return SnackBar(content: Text("Error inicializando Firebase"));
              } else if (snapshot.connectionState == ConnectionState.done) {
                developer.log(TAG + ", Firebase init. DONE");
                return SplashScreen(
                  seconds: ConstantsApp.TIME_SPLASH_SCREEN,
                  navigateAfterSeconds: Welcome(),
                  image: AssetsImages.ImageLauncher(),
                  backgroundColor: Colors.white,
                  photoSize: 200,
                  loaderColor: Theme.of(context).primaryColor,
                  loadingText: Text(TextApp.LOADING,
                      style: Theme.of(context).textTheme.bodyText1),
                  gradientBackground: DesignWidgets.linearGradientMain(context),
                );
              }
              return CircularProgressIndicator();
            }));
  }
}
