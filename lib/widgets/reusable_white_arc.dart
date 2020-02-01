import 'package:flutter/material.dart';

class ReusableWhiteArc extends StatelessWidget {
  final double upperWidth;

  final Widget upperChild;
  final Widget lowerChild;

  const ReusableWhiteArc({this.upperWidth, this.upperChild, this.lowerChild});

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxWidth: upperWidth,
      child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 7,
              child: upperChild,
            ),
            Flexible(
              flex: 1,
              child: lowerChild,
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(upperWidth / 2),
            bottomRight: Radius.circular(upperWidth / 2),
          ),
        ),
      ),
    );
  }
}
