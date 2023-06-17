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

// method for tracking evry user marker and save it to the _marker set
  void _handleMapTap(LatLng tappedLocation) {
    setState(() {
      locs.add(tappedLocation);
      SessionPref.setDataString(locs, "okay");
      _markers.add(
        Marker(
          markerId: MarkerId(tappedLocation.toString()),
          position: tappedLocation,
          infoWindow: InfoWindow(
            title: "Space X",
            snippet: "1020 S.A",

          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        leading: ElevatedButton(
            onPressed: () {
              print(SessionPref.getDataArray()![1]);
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
