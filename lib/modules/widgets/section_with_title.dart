import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionWithTitle({Key key, @required this.title, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
        child,
        SizedBox(height: 30)
      ],
    );
  }

}