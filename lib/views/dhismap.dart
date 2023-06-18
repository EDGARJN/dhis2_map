import 'package:dhis_map/services/session.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};
  var locs = SessionPref.getList();

// method for tracking evry user marker and save it to the _marker set
  void _handleMapTap(LatLng tappedLocation) {
    setState(() {
      locs.add(tappedLocation);
      SessionPref.saveList(locs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        actions: [
          ElevatedButton(
              onPressed: () {
                var data = SessionPref.getList();
                print(data[0]);
              },
              child: Text("GET "))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.422, -122.084),
          zoom: 15.0,
        ),
        // markers: _markers,
        markers: {
          for (var i in SessionPref.getList())
            Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(i[0], i[1]),
              infoWindow: InfoWindow(
                  title: "Space X",
                  snippet: "1020 S.A",
                  onTap: () {
                    locs.remove(i);
                  }),
            )
        },
        onTap: _handleMapTap,
      ),
    );
  }
}
