// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:mudad_app/google_maps/home_map/cubit/states.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LocationCubit extends Cubit<LocationState> {
//   LatLng currentLocation = const LatLng(25, 45);
//   Set<Polygon> polygon = {};
//   GoogleMapController? mapController;
//   final places =
//       GoogleMapsPlaces(apiKey: 'AIzaSyDu184vis9uZwt9OqWD6AosFbBLDnPxsQ0');
//
//   LocationCubit() : super(LocationInitialState()) {
//     initPolygon();
//   }
//   void initPolygon() {
//     Polygon polygon1 = Polygon(
//         strokeWidth: 3,
//         strokeColor: Colors.blueAccent,
//         fillColor: Colors.white.withOpacity(.5),
//         polygonId: const PolygonId("1"),
//         points: const [
//           LatLng(19.075133912332912, 51.95965572242065),
//           LatLng(20.087241383043505, 54.86908398817116),
//           LatLng(22.050222087999465, 55.562870728465526),
//           LatLng(22.7743555816087, 55.160026814746224),
//           LatLng(22.982789807517765, 52.565735280353614),
//           LatLng(28.5681340307262, 48.27048729480175),
//           LatLng(28.568134076455298, 47.66621282931334),
//           LatLng(29.026116427880186, 47.40490496958315),
//           LatLng(29.25435045253114, 44.67750418364933),
//           LatLng(31.091057470649762, 42.0454571293514),
//           LatLng(31.959180435756334, 40.37129377847423),
//           LatLng(32.148371993700934, 39.19937943286021),
//           LatLng(31.49510305746695, 37.03053567267064),
//           LatLng(30.54008337270809, 37.992595242514454),
//           LatLng(30.339632956564127, 37.66389155615115),
//           LatLng(30.048596720889392, 37.511565457592546),
//           LatLng(29.923604027525254, 36.741917833431515),
//           LatLng(29.226349910549303, 36.060458971458814),
//           LatLng(29.44001052297099, 34.97433172434066),
//           LatLng(28.08718672075626, 35.19296555108319),
//           LatLng(26.1186218378482, 36.66772328245969),
//           LatLng(26.007841459252248, 36.82187450664885),
//           LatLng(25.08994177011998, 37.31515814796409),
//           LatLng(24.326668959975247, 37.74246840286043),
//           LatLng(23.752241779968305, 38.545173674306426),
//           LatLng(22.301347713542466, 39.13091378620913),
//           LatLng(21.744014964116797, 39.06327619062055),
//           LatLng(21.0656434971596, 39.2909866622608),
//           LatLng(20.332306728325, 40.07493332810857),
//           LatLng(19.54133222956233, 41.055892797644695),
//           LatLng(18.235621680035628, 41.531701614551494),
//           LatLng(17.778684682603203, 41.9340977709835),
//           LatLng(17.443905948238466, 42.314982055328585),
//           LatLng(17.02354842130596, 42.530119682435576),
//           LatLng(16.68711878044832, 42.72978989791429),
//           LatLng(16.412152179700303, 42.79306566958337),
//           LatLng(16.385014589003617, 42.830030852193715),
//           LatLng(16.402973312795492, 42.93186658138995),
//           LatLng(16.499921749955977, 42.94609363179236),
//           LatLng(16.525048612162212, 42.99102115937893),
//           LatLng(16.534380614367397, 43.12056219725354),
//           LatLng(16.68147930701042, 43.1422771689204),
//           LatLng(16.647046792786032, 43.23213222409354),
//           LatLng(16.702996484572967, 43.226890702967786),
//           LatLng(16.794775818513482, 43.262083932910606),
//           LatLng(16.886510803444544, 43.14676994216122),
//           LatLng(16.9259145029896, 43.143774773655444),
//           LatLng(16.948120228776368, 43.18346075635692),
//           LatLng(17.031905287337974, 43.177470419912574),
//           LatLng(17.017585713875885, 43.20068297602137),
//           LatLng(17.211675323639344, 43.215428615197325),
//           LatLng(17.55749278628297, 43.366731054734025),
//           LatLng(17.3479782925023, 43.94379872708643),
//           LatLng(17.293121926308583, 46.74712571495784),
//           LatLng(16.975418973089226, 46.989287289051916),
//           LatLng(17.171456417103776, 47.4374314438043),
//           LatLng(18.669861396558154, 49.10228720451955),
//         ]);
//     polygon.add(polygon1);
//   }
//
//   bool isPointInsidePolygon(List<LatLng> polygon, LatLng tappedLocation) {
//     int i, j;
//     bool isInside = false;
//     int polygonLength = polygon.length;
//
//     for ((i = 0, j = polygonLength - 1); i < polygonLength; j = i, i++) {
//       if (((polygon[i].latitude > tappedLocation.latitude) !=
//               (polygon[j].latitude > tappedLocation.latitude)) &&
//           (tappedLocation.longitude <
//               (polygon[j].longitude - polygon[i].longitude) *
//                       (tappedLocation.latitude - polygon[i].latitude) /
//                       (polygon[j].latitude - polygon[i].latitude) +
//                   polygon[i].longitude)) {
//         isInside = !isInside;
//       }
//     }
//     return isInside;
//   }
//
//   Future<LatLng> getTappedLocation(BuildContext context) async {
//     if (mapController == null) {
//       throw Exception("mapController is null");
//     }
//
//     final RenderBox overlayBox = context.findRenderObject() as RenderBox;
//     final centerPosition =
//         overlayBox.localToGlobal(overlayBox.size.center(Offset.zero));
//
//     final LatLng tappedLocation = await mapController!.getLatLng(
//       ScreenCoordinate(
//         x: centerPosition.dx.toInt() + 336,
//         y: centerPosition.dy.toInt() + 723,
//       ),
//     );
//     return tappedLocation;
//   }
//
//   Future<void> saveCurrentLocation(context) async {
//     List<LatLng> firstPolygonPoints = polygon.toList()[0].points;
//
//     try {
//       LatLng tappedLocation = await getTappedLocation(context);
//       print("Tapped Location: $tappedLocation");
//       bool isInside = isPointInsidePolygon(firstPolygonPoints, tappedLocation);
//
//       if (isInside) {
//         // Tapped location is inside the polygon
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setDouble('latitude', tappedLocation.latitude);
//         prefs.setDouble('longitude', tappedLocation.longitude);
//
//         emit(LocationSavedState(
//           LatLng(
//             prefs.getDouble('latitude')!,
//             prefs.getDouble('longitude')!,
//           ),
//         ));
//       } else {
//         // Tapped location is outside the polygon
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('The site is outside the permitted scope'.tr),
//           ),
//         );
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
