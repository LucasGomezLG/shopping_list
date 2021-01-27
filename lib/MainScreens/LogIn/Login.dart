import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:shopping_list/MainScreens/LogIn/singUp.dart';
import 'package:shopping_list/MainScreens/home.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Design/DesignWidgets.dart';
import 'package:shopping_list/Widgets/components/buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/components/buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/components/buttons/mySingUpButton.dart';
import 'package:shopping_list/Widgets/components/containers/containerShape01.dart';
import 'package:shopping_list/Widgets/components/fields/myFieldForm.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        MyFieldForm(tittle: TextApp.EMAIL_ID),
        MyFieldForm(tittle: TextApp.PASSWORD, isPassword: true),
      ],
    );
  }

  Widget _forgottenPassword() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: Text(TextApp.FORGOT_PASSWORD,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(TextApp.OR),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
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
              TextApp.DONT_HAVE_ACCOUNT,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              TextApp.SINGUP,
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
                  text: TextApp.LOGIN,
                  colorText: Colors.white,
                  colorButtonBackgroud: Theme.of(context).primaryColor,
                  widgetToNavigate: Home()),
              _forgottenPassword(),
              _divider(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: GoogleSignInButton(
                    centered: true,
                    borderRadius: 5,
                    onPressed: () {},
                    darkMode: false,
                    text: TextApp.GOOGLE_SING),
              ),
              MySingUpButton(
                firstText: TextApp.DONT_HAVE_ACCOUNT,
                secondText: TextApp.SINGUP,
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
