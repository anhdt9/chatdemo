import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionWithTitle extends StatelessWidget {

  const SectionWithTitle({Key key, @required this.title, @required this.child}) : super(key: key);
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
        child,
        const SizedBox(height: 30)
      ],
    );
  }

}