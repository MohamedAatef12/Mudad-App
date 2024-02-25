import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as gmaps;

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  late OverlayEntry overlayEntry;
  TextEditingController searchController = TextEditingController();
  List<gmaps.Prediction> _searchResults = [];

  @override
  void initState() {
    super.initState();
    overlayEntry = _createOverlayEntry();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: ((context, state) {
        if (state is LocationSavedState) {
          // Display a snackbar when the location is saved
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم حفظ الموقع بنجاح'),
            ),
          );
        }
      }),
      builder: ((context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: locationCubit.currentLocation,
                    zoom: 5,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    locationCubit.mapController = controller;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Overlay.of(context).insert(overlayEntry);
                    });
                  },
                  mapType: MapType.hybrid,
                  trafficEnabled: true,
                  polygons: locationCubit.polygon,
                  zoomControlsEnabled: false, // Disable default zoom controls
                  myLocationButtonEnabled:
                      false, // Disable default location button
                  zoomGesturesEnabled: true,
                  onTap: (LatLng latLng) {
                    // Dismiss the keyboard and clear search results on map tap
                    if (_searchResults.isNotEmpty) {
                      clearSearchResults();
                      FocusScope.of(context).unfocus();
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 40,
                  left: 0,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF609FD8),
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 5,
                  left: 55,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E1E1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_searchResults.isNotEmpty) {
                                  moveCameraToLocation(
                                      _searchResults.first.placeId!);
                                } else {
                                  moveCameraToPlaceFromText();
                                }
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF609FD8),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 45,
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (query) {
                                  performAutocompleteSearch(query);
                                },
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  hintText: 'ابحث عن منزل',
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    highlightColor: Colors.transparent,
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      searchController.clear();
                                      clearSearchResults();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: _searchResults.length * 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListView.builder(
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_searchResults[index].description!),
                              onTap: () {
                                getPlaceDetails(_searchResults[index].placeId!);
                                moveCameraToLocation(
                                    _searchResults[index].placeId!);
                                setState(
                                  () {
                                    searchController.text =
                                        _searchResults[index].description!;
                                    clearSearchResults();
                                    FocusScope.of(context).unfocus();
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height - 80,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  width: MediaQuery.of(context).size.width - 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      LatLng tappedLocation =
                          await locationCubit.getTappedLocation(context);

                      bool isInsidePolygon = locationCubit.isPointInsidePolygon(
                        locationCubit.polygon.isNotEmpty
                            ? locationCubit.polygon.first.points
                            : [],
                        tappedLocation,
                      );

                      print("Tapped Location: $tappedLocation");
                      print("Is inside polygon: $isInsidePolygon");

                      if (isInsidePolygon) {
                        // The tapped location is inside the polygon
                        locationCubit.saveCurrentLocation(
                            context); // Provide context here
                        buildBottomSheet(context, tappedLocation);
                      } else {
                        // The tapped location is outside the polygon
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('الموقع خارج النطاق المسموح به'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "اختر الموقع",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Stack(
              children: [
                Positioned(
                  bottom: 110,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      mini: true,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        locationCubit.mapController!.animateCamera(
                          CameraUpdate.newLatLng(
                            const LatLng(25, 45),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.gps_fixed,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            mini: true,
                            onPressed: () {
                              locationCubit.mapController!.animateCamera(
                                CameraUpdate.zoomIn(),
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                          height: 10,
                          child: Divider(
                            color: Colors.black,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 0,
                            mini: true,
                            backgroundColor: Colors.white,
                            onPressed: () {
                              locationCubit.mapController!.animateCamera(
                                CameraUpdate.zoomOut(),
                              );
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> buildBottomSheet(context, LatLng tappedLocation) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        tappedLocation.latitude,
        tappedLocation.longitude,
        localeIdentifier: "ar_SA",
      );

      String address = "Unknown location";
      String country = placeMarks.isNotEmpty ? placeMarks[0].country ?? "" : "";

      if (placeMarks.isNotEmpty) {
        // Concatenate country name and street
        String street = placeMarks[0].street ?? "";
        String administrativeArea = placeMarks[0].administrativeArea ?? "";
        address = "$street, $administrativeArea";
      }

      // Display the bottom sheet
      showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 0.3,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "الموقع",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 80,
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 40,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                textDirection: TextDirection.rtl,
                                address,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                country,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save the location and display a snackbar
                    locationCubit.saveCurrentLocation(
                        context); // Pass the correct context
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم حفظ الموقع بنجاح'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "حفظ الموقع",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      print("Error getting location name: $e");
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => const Center(
        child: Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 42.0,
        ),
      ),
    );
  }

  Future<void> getPlaceDetails(String placeId) async {
    try {
      // Fetch details if not in cache
      gmaps.PlacesDetailsResponse details =
          await locationCubit.places.getDetailsByPlaceId(
        placeId,
        language: 'ar',
        region: 'sa',
      );

      if (details.isOkay) {
        setState(() {
          searchController.text = details.result as String;
        });
      } else {
        throw Exception('Failed to fetch place details');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      // Handle errors
    }
  }

  Future<void> performAutocompleteSearch(String query) async {
    try {
      LatLngBounds saudiArabiaBounds = LatLngBounds(
        southwest: const LatLng(16.456808125987084, 34.92532922317433),
        northeast: const LatLng(32.1048459480552, 51.0802984261652),
      );

      gmaps.PlacesAutocompleteResponse response =
          await locationCubit.places.autocomplete(
        query,
        components: [
          gmaps.Component(
              gmaps.Component.country, 'SA'), // Restrict to Saudi Arabia
        ],
        language: 'ar',
        region: 'sa',
      );

      if (response.isOkay) {
        // Filter and fetch details for each prediction
        List<gmaps.Prediction> filteredResults = [];

        for (gmaps.Prediction prediction in response.predictions) {
          gmaps.PlacesDetailsResponse details = await locationCubit.places
              .getDetailsByPlaceId(prediction.placeId!);

          if (details.isOkay) {
            gmaps.Location location = details.result.geometry!.location;

            // Convert Location to LatLng
            LatLng locationLatLng = LatLng(location.lat, location.lng);

            if (saudiArabiaBounds.contains(locationLatLng)) {
              filteredResults.add(prediction);
            }
          }
        }
        setState(() {
          _searchResults = filteredResults;
        });
      } else {
        throw Exception('Failed to fetch autocomplete results');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<void> moveCameraToPlaceFromText() async {
    String query = searchController.text;
    if (query.isNotEmpty) {
      try {
        gmaps.PlacesAutocompleteResponse response =
            await locationCubit.places.autocomplete(query);

        if (response.isOkay && response.predictions.isNotEmpty) {
          gmaps.Prediction firstResult = response.predictions.first;
          moveCameraToLocation(firstResult.placeId!);
        } else {
          throw Exception('No results found');
        }
      } catch (e) {
        log('Error: $e');
      }
    }
  }

  Future<void> moveCameraToLocation(String placeId) async {
    try {
      double zoomLevel = 14.0; // Default zoom level for cities

      gmaps.PlacesDetailsResponse details =
          await locationCubit.places.getDetailsByPlaceId(placeId);

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

      locationCubit.mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(location, zoomLevel),
      );
    } catch (e) {
      log('An error occurred: $e');
    }
  }

  void clearSearchResults() {
    setState(() {
      _searchResults.clear();
    });
  }

  @override
  void dispose() {
    overlayEntry.remove();
    super.dispose();
  }
}

LocationCubit locationCubit = LocationCubit();
