import 'package:flutter/material.dart';
import 'package:inpost_mock/widgets/reusable_white_arc.dart';

class QuickReturnsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final upperWidth = MediaQuery.of(context).size.width * 1.5;

    return Container(
      color: Color(0xFFF5F7F8),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 6,
            child: ReusableWhiteArc(
              upperWidth: upperWidth,
              upperChild: Padding(
                padding: const EdgeInsets.all(64.0),
                child: Center(
                  child: Image.asset(
                    'images/quick_returns.jpg',
                  ),
                ),
              ),
              lowerChild: SizedBox(),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You haven\'t sent any returns yet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Click (+) for a quick return',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFB9BFCF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
