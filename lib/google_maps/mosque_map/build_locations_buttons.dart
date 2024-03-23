import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:mudad_app/google_maps/mosque_map/search_map.dart';

import 'loc_buttons.dart';

class BuildLocationsButtons extends StatelessWidget {
  const BuildLocationsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 6.4,
      bottom: 0,
      right: 2,
      child: Column(
        children: [
          PlaceButton(
            onPressed: () {
              googleMapController.animateCamera(
                CameraUpdate.newLatLng(const LatLng(
                  21.423888489772935,
                  39.82624903841808,
                )),
              );
              moveCameraToPlace("Makkah");
            },
            imagePath: "assets/images/4.png",
            placeName: "Mecca\nMosques".tr,
            coordinates: const LatLng(21.423888489772935, 39.82624903841808),
            labelFontSize: 20,
            iconWidth: 34.4,
            iconHeight: 34.4,
          ),
          // PlaceButton(
          //   onPressed: () {
          //     googleMapController.animateCamera(
          //       CameraUpdate.newLatLng(const LatLng(
          //         24.467663304009072,
          //         39.61106777648205,
          //       )),
          //     );
          //     moveCameraToPlace("Madinah");
          //   },
          //   imagePath: "assets/images/5.png",
          //   placeName: "AL Madinah\nMosques".tr,
          //   coordinates: const LatLng(24.467663304009072, 39.61106777648205),
          //   labelFontSize: 20,
          //   iconWidth: 33,
          //   iconHeight: 33,
          // ),
          PlaceButton(
            onPressed: () {
              googleMapController.animateCamera(
                CameraUpdate.newLatLng(const LatLng(
                  21.52774807596778,
                  39.16439325129956,
                )),
              );
              moveCameraToPlace("Jeddah");
            },
            imagePath: "assets/images/7.png",
            placeName: "Jeddah\nMosques".tr,
            coordinates: const LatLng(21.52774807596778, 39.16439325129956),
            labelFontSize: 17,
            iconWidth: 33,
            iconHeight: 33,
          ),
          // PlaceButton(
          //   onPressed: () {
          //     googleMapController.animateCamera(
          //       CameraUpdate.newLatLng(const LatLng(
          //         21.389591400346944,
          //         39.83733700721687,
          //       )),
          //     );
          //     moveCameraToPlace("Mosques of the pilgrims");
          //   },
          //   imagePath: "assets/images/6.png",
          //   placeName: "Umrah pilgrims\nMosques".tr,
          //   coordinates: const LatLng(21.389591400346944, 39.83733700721687),
          //   labelFontSize: 20,
          //   iconWidth: 30,
          //   iconHeight: 33,
          // ),
        ],
      ),
    );
  }
}

Future<void> moveCameraToPlace(String placeId) async {
  try {
    double zoomLevel = 14.0; // Default zoom level for cities

    // Check if the placeId is Jeddah (you can modify this based on your data)
    if (placeId == "Jeddah") {
      const LatLng jeddahLocation =
          LatLng(21.52774807596778, 39.16439325129956);
      googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(jeddahLocation, zoomLevel),
      );
      return;
    }

    if (placeId == "Makkah") {
      const LatLng makkahLocation =
          LatLng(21.423888489772935, 39.82624903841808);
      googleMapController.animateCamera(
        CameraUpdate.newLatLngZoom(makkahLocation, zoomLevel),
      );
      return;
    }

    // if (placeId == "Madinah") {
    //   const LatLng madinahLocation =
    //       LatLng(24.467663304009072, 39.61106777648205);
    //   googleMapController.animateCamera(
    //     CameraUpdate.newLatLngZoom(madinahLocation, zoomLevel),
    //   );
    //   return;
    // }
    //
    // if (placeId == "Mosques of the pilgrims") {
    //   const LatLng mo3tamerinLocation =
    //       LatLng(21.389591400346944, 39.83733700721687);
    //   googleMapController.animateCamera(
    //     CameraUpdate.newLatLngZoom(mo3tamerinLocation, zoomLevel),
    //   );
    //   return;
    // }

    PlacesDetailsResponse details = await places.getDetailsByPlaceId(placeId);

    // Check the types and set zoomLevel accordingly
    if (details.result.types.contains("country")) {
      zoomLevel = 5.0; // zoom out for countries
    } else if (details.result.types.contains("locality")) {
      zoomLevel = 12.0; // zoom in for cities
    } else if (details.result.types.contains("route")) {
      zoomLevel = 16.0; // zoom in further for streets
    } else if (details.result.types.contains("mosque")) {
      zoomLevel = 17.0; // zoom in further for streets
    }

    final LatLng location = LatLng(
      details.result.geometry!.location.lat,
      details.result.geometry!.location.lng,
    );

    googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(location, zoomLevel),
    );
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
