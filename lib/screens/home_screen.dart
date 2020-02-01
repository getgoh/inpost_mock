import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inpost_mock/screens/home_pages/archive_page.dart';
import 'package:inpost_mock/screens/home_pages/home_parcel_tracking.dart';
import 'package:inpost_mock/screens/home_pages/quick_returns_page.dart';
import 'package:inpost_mock/widgets/yellow_arc.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavBarIndex = 0;

  Color appBarColor = Color(0xFFFDCA06);
  String appBarTitle = 'Parcel tracking';
  bool isFABVisible = true;
  bool isYellowArcVisible = true;

  var homePages = [ParcelTrackingPage(), ArchivePage(), QuickReturnsPage()];

  _buildBottomNavigationBar() {
    List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(
          title: SizedBox(),
          icon: Icon(
            FontAwesomeIcons.mapMarker,
          )),
      BottomNavigationBarItem(
          title: SizedBox(), icon: Icon(FontAwesomeIcons.scroll)),
      BottomNavigationBarItem(
          title: SizedBox(), icon: Icon(FontAwesomeIcons.box)),
      BottomNavigationBarItem(
          title: SizedBox(), icon: Icon(FontAwesomeIcons.fire)),
    ];

    return bottomItems;
  }

  onBottomNavigationTap(BuildContext context, int index) {
    setState(() {
      _bottomNavBarIndex = index != 3 ? index : _bottomNavBarIndex;
      print('_bottomNavBarIndex: $_bottomNavBarIndex');

      switch (index) {
        case 0:
          {
            appBarColor = Color(0xFFFDCA06);
            appBarTitle = 'Parcel tracking';
            isFABVisible = true;
            isYellowArcVisible = true;
          }
          break;
        case 1:
          {
            appBarColor = Colors.white;
            appBarTitle = 'Archive';
            isFABVisible = false;
            isYellowArcVisible = false;
          }
          break;
        case 2:
          {
            appBarColor = Colors.white;
            appBarTitle = 'Quick returns';
            isFABVisible = true;
            isYellowArcVisible = false;
          }
          break;
        case 3:
          {
            // 4th action doesn't have implementation..
            appBarColor = appBarColor;
            appBarTitle = appBarTitle;
            isFABVisible = isFABVisible;
            isYellowArcVisible = isYellowArcVisible;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upperWidth = MediaQuery.of(context).size.width * 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          isYellowArcVisible
              ? YellowArc(
                  upperWidth: upperWidth,
                )
              : SizedBox(),
          homePages[_bottomNavBarIndex]
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Colors.black54,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.black54,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          onBottomNavigationTap(context, index);
        },
        currentIndex: _bottomNavBarIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        selectedItemColor: Color(0xFFffcb06),
        items: _buildBottomNavigationBar(),
      ),
      floatingActionButton: isFABVisible
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Color(0xFFffcb06),
            )
          : null,
    );
  }
}
