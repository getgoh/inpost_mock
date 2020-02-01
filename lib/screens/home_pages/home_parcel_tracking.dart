import 'package:flutter/material.dart';
import 'package:inpost_mock/constants.dart';
import 'package:inpost_mock/widgets/parcel_card.dart';

class ParcelTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ListView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 80),
        children: <Widget>[
          Card(
            elevation: 8.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 15.0),
                            Text(
                              'My Parcel',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Divider(
                              color: Color(0xFFe8ebf5),
                              thickness: 2.0,
                            ),
                            Text(
                              'NUMBER:',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text('2938401938457463'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image.asset(
                              'images/my_parcel.jpg',
                              height: 64.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'WAITING FOR COLLECTION',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text('Mo | 19.06.18 | 11:30'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'RECEPTION VENUE',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text('KAT08A'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'REMAINING',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text('16 Hours 30 Min'),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: LinearProgressIndicator(
                                value: 0.3,
                                backgroundColor: Color(0xFFf5f7f9),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFffcb06)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'OPENING HOURS',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text('Mo-Fr | 7:00-15:30'),
                            SizedBox(height: 5.0),
                            Text('Sa-Su | 8:00-22:00'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'STATUS',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'For pickup',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ParcelCard(
            title: 'Parcel observed',
            name: 'Birthday gift',
            delivery: 'Mo | 14.06.18',
            status: 'On the way',
          ),
          SizedBox(height: 10.0),
          ParcelCard(
            title: 'Parcel observed',
            name: 'Birthday gift',
            delivery: 'Mo | 14.06.18',
            status: 'On the way',
          ),
          SizedBox(height: 10.0),
          ParcelCard(
            title: 'RETURN',
            name: 'RETURN FOR SHOP EOBUWIE',
            delivery: 'Mo | 14.06.18',
            status: 'Picked by courier',
          ),
        ],
      ),
    );
  }
}
