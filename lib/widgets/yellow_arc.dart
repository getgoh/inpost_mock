import 'package:flutter/material.dart';

// needs to be inside a stack to work as intended
class YellowArc extends StatelessWidget {
  YellowArc({@required this.upperWidth});

  final double upperWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -upperWidth + (upperWidth / 8),
      left: -upperWidth / 6,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: upperWidth,
          width: upperWidth,
          decoration: BoxDecoration(
            color: Color(0xFFFDCA06),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(upperWidth / 2),
              bottomRight: Radius.circular(upperWidth / 2),
            ),
          ),
        ),
      ),
    );
  }
}
