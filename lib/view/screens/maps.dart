import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapsDisplay extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapsDisplay> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(29.960060974539, 30.918692350388);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.addMarker(MarkerOptions(
      draggable: false,
      position: _center,
      infoWindowText: InfoWindowText("GMS Group", "66 المحور المركزي")
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 200.0,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              cameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
            ),
          ),
        );
  }
}