import 'package:flutter/material.dart';

class MapChoiceBox extends StatelessWidget {
  const MapChoiceBox({
    this.imgString,
    this.text,
    this.isSelected,
    this.onTap,
  });

  final String imgString;
  final String text;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final choiceBoxWidth = (screenWidth - (screenWidth * 0.1)) / 3;
    final choiceBoxHeight = screenHeight / 12;

    return GestureDetector(
      onTap: this.onTap,
      child: Center(
        child: Container(
          width: choiceBoxWidth,
          height: choiceBoxHeight,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imgString,
                height: 20.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
