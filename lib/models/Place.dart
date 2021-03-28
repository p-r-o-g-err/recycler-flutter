import 'package:recycler_flutter_app/values/Sizes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycler_flutter_app/enums/PlaceType.dart';
import 'package:recycler_flutter_app/utils/ImagesUtils.dart';

//TODO на получение картинки  обвесить try catch

class Place {
  String _markerPicPath;
  String _markerID;
  String _title;
  String _snippet;
  LatLng _latLng;
  PlaceType _placeType;
  LatLng _placeCoordinates;
  BitmapDescriptor _markerIcon;

  Place(String markerID, LatLng coordinates, String title, String snippet,
      PlaceType placeType) {
    _markerPicPath = _picPath(placeType);
    _setMarkerIcon();
    _placeType = placeType;
    _latLng = coordinates;
    _title = title;
    _snippet = snippet;
    _markerID = markerID;
  }

  LatLng getLatLng() {
    return _placeCoordinates;
  }

  PlaceType getPlaceType() {
    return _placeType;
  }

  String getTitle() {
    return _title;
  }

  String getSnippet() {
    return _snippet;
  }

  String _picPath(PlaceType placeType) {
    //TODO ВЫБОР ПУТИ К КАРТИНКЕ В ЗАВИСИМОСТИ ОТ ТИПА МЕСТА.
    // ДУМАЮ ИСПОЛЬЗОВАТЬ PLACETYPE.TOSTRING И УКАЗЫВАТЬ НАЗВАНИЯ ФАЙЛОВ СООТВЕТСТВЕННО ТАК : PlaceType.unconfirmed (К ПРИМЕРУ)
    return null;
  }

  Future<void> _setMarkerIcon() async {
    _markerIcon = BitmapDescriptor.fromBytes(
        await ImagesUtils.getBytesFromPngAsset(
            _markerPicPath, markersIconSize));
  }

  Future<Marker> getMarker() async {
    return new Marker(
        markerId: MarkerId(_markerID),
        position: _latLng,
        infoWindow: InfoWindow(title: "TITLE", snippet: "Snippet"),
        icon: _markerIcon);
  }
}
