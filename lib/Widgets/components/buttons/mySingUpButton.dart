import 'package:flutter/material.dart';

class MySingUpButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final Widget widgetToNavigate;

  MySingUpButton(
      {this.firstText,
      this.secondText,
      this.secondTextColor,
      this.widgetToNavigate});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => widgetToNavigate)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              firstText,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              secondText,
              style: TextStyle(
                  color: secondTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
