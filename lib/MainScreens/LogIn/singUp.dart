import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:shopping_list/MainScreens/LogIn/Login.dart';
import 'package:shopping_list/MainScreens/home.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:shopping_list/Widgets/components/buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/components/buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/components/buttons/mySingUpButton.dart';
import 'package:shopping_list/Widgets/components/containers/containerShape01.dart';
import 'package:shopping_list/Widgets/components/fields/myFieldForm.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        MyFieldForm(tittle: TextApp.USER_NAME),
        MyFieldForm(tittle: TextApp.EMAIL_ID),
        MyFieldForm(tittle: TextApp.PASSWORD, isPassword: true),
      ],
    );
  }

  Widget _singUpLabel() {
    return FlatButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SingUp())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              TextApp.I_HAVE_ACCOUNT,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              TextApp.LOGIN,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        ContainerShape01(),
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: height * .15),
                  child: DesignWidgets.tittleCustomDark()),
              Padding(
                padding: EdgeInsets.only(top: height * .05),
                child: _emailPasswordWidget(),
              ),
              MyLoginButton(
                  text: TextApp.SINGUP,
                  colorText: Colors.white,
                  colorButtonBackgroud: Theme.of(context).primaryColor,
                  widgetToNavigate: Home()),
              MySingUpButton(
                firstText: TextApp.I_HAVE_ACCOUNT,
                secondText: TextApp.LOGIN,
                secondTextColor: Theme.of(context).primaryColorDark,
                widgetToNavigate: SingUp(),
              )
            ],
          ),
        ),
        Positioned(top: height * .025, child: MyBackButton()),
      ],
    )));
  }
}
