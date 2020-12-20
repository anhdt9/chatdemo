import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({this.text, this.onPress, this.color});

  final String text;
  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 70, right: 70),
      child: Text(text, style: TextStyle(fontSize: 18)),
      onPressed: onPress,
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
