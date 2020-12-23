import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({this.text, this.onPress, this.color});

  final String text;
  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: 100,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Text(text, style: const TextStyle(fontSize: 18)),
      onPressed: onPress,
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
