import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/LogIn/Login.dart';
import 'package:shopping_list/MainScreens/LogIn/singUp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:shopping_list/Widgets/components/buttons/myLoginButton.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

Widget _singUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: OutlineButton(
        borderSide: BorderSide(color: Colors.white),
        highlightedBorderColor: Theme.of(context).primaryColorLight,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SingUp())),
        child: Text(TextApp.SINGUP,
            style: TextStyle(fontSize: 18, color: Colors.white))),
  );
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: DesignWidgets.linearGradientMain(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DesignWidgets.tittleCustom(),
              MyLoginButton(
                  text: TextApp.LOGIN,
                  colorButtonBackgroud: Theme.of(context).primaryColor,
                  colorText: Colors.white,
                  widgetToNavigate: Login()),
              _singUpButton(context)
            ],
          ),
        )),
      ),
    );
  }
}
