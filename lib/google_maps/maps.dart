import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MosquesMap extends StatefulWidget {
  const MosquesMap({Key? key}) : super(key: key);

  @override
  State<MosquesMap> createState() => _MapsState();
}

class _MapsState extends State<MosquesMap> {
  late GoogleMapController controllerMapController;
  final Set<Marker> markers = {};
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(23.8859, 45.0792), // Center of Saudi Arabia
      zoom: 6,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          controllerMapController = controller;
        },
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }
}
