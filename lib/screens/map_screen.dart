import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:inpost_mock/data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inpost_mock/models/map_marker.dart';
import 'package:inpost_mock/widgets/map_choice_box.dart';
import 'dart:ui' as ui;

import 'package:inpost_mock/widgets/yellow_arc.dart';

class MapScreen extends StatefulWidget {
  static final String id = 'map_screen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedChoice = 0;

  BitmapDescriptor _markerIcon_pop;
  BitmapDescriptor _markerIcon_parcel;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon_pop == null) {
      final Uint8List _markerIcon_pop_temp =
          await getBytesFromAsset('images/marker_blue.png', 80);
      setState(() {
        _markerIcon_pop = BitmapDescriptor.fromBytes(_markerIcon_pop_temp);
      });
    }
    if (_markerIcon_parcel == null) {
      final Uint8List _markerIcon_parcel_temp =
          await getBytesFromAsset('images/marker_green.png', 80);
      setState(() {
        _markerIcon_parcel =
            BitmapDescriptor.fromBytes(_markerIcon_parcel_temp);
      });
    }
  }

  void _updateBitmap_pop(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon_pop = bitmap;
    });
  }

  void _updateBitmap_parcel(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon_parcel = bitmap;
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final _initCameraPosition = CameraPosition(
    target: LatLng(43.668453, -79.416440),
    zoom: 15.0,
  );

  Set<Marker> _createMarkers() {
    List<Marker> markers = [];
    var currMarkerList = markerList;

    if (_selectedChoice == 1) {
      currMarkerList =
          markerList.where((m) => m.markerType == 'parcel_machine').toList();
    } else if (_selectedChoice == 2) {
      currMarkerList = markerList.where((m) => m.markerType == 'pop').toList();
    }

    for (var m in currMarkerList) {
      print(m.markerType);
      final currIcon =
          m.markerType == 'pop' ? _markerIcon_pop : _markerIcon_parcel;
      final currMarker = Marker(
          position: LatLng(m.lat, m.lng),
          markerId: MarkerId(m.markerId),
          infoWindow: InfoWindow(title: m.title, snippet: m.snippet),
          icon: currIcon);

      markers.add(currMarker);
    }

    return markers.toSet();
  }

  void onBoxTap(int index) {
    print('Clicked $index');
    setState(() {
      _selectedChoice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);

//    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final upperWidth = MediaQuery.of(context).size.width * 1.5;
    print('Screen height: $screenHeight');

//    final choiceBoxWidth = (screenWidth - (screenWidth * 0.1)) / 3;
//    final choiceBoxHeight = screenHeight / 12;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Parcel pickup points',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFDCA06),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _createMarkers(),
          ),
          YellowArc(upperWidth: upperWidth),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  child: Row(
                    children: <Widget>[
                      MapChoiceBox(
                        onTap: () {
                          onBoxTap(0);
                        },
                        text: 'ALL',
                        imgString: 'images/marker_yellow.png',
                        isSelected: _selectedChoice == 0,
                      ),
                      SizedBox(
                        width: 1.0,
                      ),
                      MapChoiceBox(
                        onTap: () {
                          onBoxTap(1);
                        },
                        text: 'PARCEL MACHINE',
                        imgString: 'images/marker_green.png',
                        isSelected: _selectedChoice == 1,
                      ),
                      SizedBox(
                        width: 1.0,
                      ),
                      MapChoiceBox(
                        onTap: () {
                          onBoxTap(2);
                        },
                        text: 'POP',
                        imgString: 'images/marker_blue.png',
                        isSelected: _selectedChoice == 2,
                      ),
                    ],
                  ),
                  elevation: 10.0,
                  color: Color(0xFFC1C8D9),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
