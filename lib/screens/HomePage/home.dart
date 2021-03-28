import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycler_flutter_app/utils/ImagesUtils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final LatLng _tyumenCenter = LatLng(57.151327, 65.53716);
  LatLng _lastMapPos = _tyumenCenter;

  GoogleMapController _mapController;
  Set<Marker> _markers = HashSet<Marker>();
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("0"),
          position: _lastMapPos,
          infoWindow: InfoWindow(title: "TITLE", snippet: "Snippet"),
          icon: _markerIcon));
    });
  }

  void _setMarkerIcon() async {
    _markerIcon = BitmapDescriptor.fromBytes(
        await ImagesUtils.getBytesFromPngAsset(
            'lib/assets/images/markers/009-recycle.png', Size(50, 50)));
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
}
