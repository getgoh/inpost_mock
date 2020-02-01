import 'package:flutter/material.dart';
import 'package:inpost_mock/constants.dart';

class ParcelCard extends StatelessWidget {
  final String title;
  final String name;
  final String delivery;
  final String status;

  const ParcelCard({this.title, this.name, this.delivery, this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Divider(
                        color: Color(0xFFe8ebf5),
                        thickness: 2.0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        'images/parcel_observed.jpg',
                        height: 64.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'NAME',
                  style: kLabelTextStyle,
                ),
                SizedBox(height: 5.0),
                Text(this.name),
              ],
            ),
            SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ESTIMATED DELIVERY TIME',
                  style: kLabelTextStyle,
                ),
                SizedBox(height: 5.0),
                Text(this.delivery),
              ],
            ),
            SizedBox(height: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'STATUS',
                  style: kLabelTextStyle,
                ),
                SizedBox(height: 5.0),
                Text(
                  this.status,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
