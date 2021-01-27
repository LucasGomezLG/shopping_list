import 'package:flutter/material.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

Widget _loginButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 50.0, bottom: 25),
    width: double.infinity,
    child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('boton iniciar sesion pulsado'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        child: Text(TextApp.LOGIN,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold))),
  );
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
        onPressed: () => print('boton registrarse pulsado'),
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
              _loginButton(context),
              _singUpButton(context)
            ],
          ),
        )),
      ),
    );
  }
}
