import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withAlpha(50), width: 0),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );

Stack bottomNavigationBarIemIcon(IconData iconData, RxInt counter) =>
    Stack(children: <Widget>[
      Icon(iconData),
      if (counter.value > 0)
        Obx(() => Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  '${counter.value}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ))
    ]);
