import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController _mapController;
  static final LatLng _tyumenCenter = LatLng(57.151327, 65.53716);
  LatLng _lastMapPos = _tyumenCenter;
  final Set<Marker> _markers = {};
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    getBytesFromAsset('assets/images/009-recycle.png', 64).then((onValue) {
      _markerIcon = BitmapDescriptor.fromBytes(onValue);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("00000"),
            position: _lastMapPos,
            infoWindow: InfoWindow(title: "TITLE", snippet: "Snippet"),
            icon: _markerIcon),
      );
    });
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(100, 100)),
        'assets/images/009-recycle.png');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: _tyumenCenter, zoom: 13),
        onMapCreated: _onMapCreated,
        markers: _markers,
      ),
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
