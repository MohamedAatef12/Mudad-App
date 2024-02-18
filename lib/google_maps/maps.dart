import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mudad_app/google_maps/location_service.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController controllerMapController;
  final Set<Marker> markers = {};
  late CameraPosition initialCameraPosition;
  final Completer<GoogleMapController> _controller = Completer();
  TextEditingController searchController = TextEditingController();
  static const CameraPosition suadi = CameraPosition(
    target: LatLng(23.8859, 45.0792),
    zoom: 6,
  );

  final Set<Marker> _markers = <Marker>{};
  @override
  void initState() {
    super.initState();
    _setMarker(const LatLng(23.8859, 45.0792));
  }

  void _setMarker(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker'),
          position: position,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search for a mosque',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var place = await LocationService()
                        .getPlaceId(searchController.text);
                    _goToPlace(place as Map<String, dynamic>);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                markers: _markers,
                initialCameraPosition: suadi,
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controllerMapController.animateCamera(
        //       CameraUpdate.newCameraPosition(
        //         const CameraPosition(
        //           target: LatLng(23.8859, 45.0792),
        //           zoom: 6,
        //         ),
        //       ),
        //     );
        //   },
        //   child: const Icon(Icons.center_focus_strong),
        // )
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'] as double;
    final double long = place['geometry']['location']['lng'] as double;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, long),
        zoom: 15,
        tilt: 50.0,
        bearing: 45.0,
      ),
    ));
    _setMarker(LatLng(lat, long));
  }
}
