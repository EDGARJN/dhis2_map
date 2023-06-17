import 'package:dhis_map/services/session.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};
  var locs = [];

  void _handleMapTap(LatLng tappedLocation) {
    setState(() {
      locs.add(tappedLocation);
      _markers.add(
        Marker(
          markerId: MarkerId(tappedLocation.toString()),
          position: tappedLocation,
          infoWindow: InfoWindow(
            title: "hello",
            snippet: "",
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionPref.setDataString(locs, "okay");

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        leading: ElevatedButton(
            onPressed: () {
              print(SessionPref.getDataArray()![0]);
            },
            child: Text("Trial")),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.422, -122.084),
          zoom: 15.0,
        ),
        markers: _markers,
        onTap: _handleMapTap,
      ),
    );
  }
}
