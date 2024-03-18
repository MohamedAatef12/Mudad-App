import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'build_choose_button.dart';
import 'build_locations_buttons.dart';
import 'build_product.dart';

class SearchMap extends StatefulWidget {
  const SearchMap({Key? key}) : super(key: key);

  @override
  State<SearchMap> createState() => _SearchMapState();
}

const CameraPosition initialCameraPosition = CameraPosition(
  target: LatLng(25, 45),
  zoom: 5,
);
late GoogleMapController googleMapController;
final places =
    GoogleMapsPlaces(apiKey: 'AIzaSyDu184vis9uZwt9OqWD6AosFbBLDnPxsQ0');
List<Prediction> _searchResults = [];
final List<Marker> _markers = [];
final List<String> selectedMosques = [];
final List<String> keywords = [
  'mosque',
  'masjid',
  'مسجد',
  'جامع',
  'musalla',
  'مصلى',
  'مساجد',
  'مساجد المعتمرين',
  'mosques',
];
List<Location> locations = [
  Location(lat: 21.423888489772935, lng: 39.82624903841808), // Makkah
  Location(lat: 24.467663304009072, lng: 39.61106777648205), // Madinah
  Location(lat: 21.389591400346944, lng: 39.83733700721687), // Mo3tamerin
  Location(lat: 21.52774807596778, lng: 39.16439325129956), // Jeddah
];
final Map<String, PlacesDetailsResponse> placeDetailsCache = {};

class _SearchMapState extends State<SearchMap> {
  final TextEditingController _controller = TextEditingController();
  final DefaultCacheManager _cacheManager = DefaultCacheManager();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchMosques();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        opacity: 0.5,
        progressIndicator: const SpinKitFadingCircle(
          color: Color(0xFF609FD8),
          size: 50.0,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              // GoogleMap(
              //   initialCameraPosition: initialCameraPosition,
              //   onMapCreated: (GoogleMapController controller) {
              //     googleMapController = controller;
              //   },
              //   cameraTargetBounds: CameraTargetBounds(
              //     LatLngBounds(
              //       southwest:
              //           const LatLng(17.607613374386183, 37.98344273015662),
              //       northeast: const LatLng(32.1048459480552, 51.0802984261652),
              //     ),
              //   ),
              //   zoomControlsEnabled: false, // Disable default zoom controls
              //   myLocationButtonEnabled:
              //       false, // Disable default location button
              //   zoomGesturesEnabled: true,
              //   onTap: (LatLng latLng) {
              //     // Dismiss the keyboard and clear search results on map tap
              //     if (_searchResults.isNotEmpty) {
              //       clearSearchResults();
              //       FocusScope.of(context).unfocus();
              //     } else {
              //       FocusScope.of(context).unfocus();
              //     }
              //   },
              //   markers: Set<Marker>.of(_markers),
              // ),
              Positioned(
                top: MediaQuery.of(context).size.height / 40,
                left: 0,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF609FD8),
                    size: 40,
                  ),
                ),
              ),
              const BuildLocationsButtons(),
              if (selectedMosques.isNotEmpty)
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  right: MediaQuery.of(context).size.width / 5,
                  left: MediaQuery.of(context).size.width / 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showListDialog();
                          },
                          child: Text('Show'.tr),
                        ),
                        Text('Selected mosques: ${selectedMosques.length}'.tr),
                      ],
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
                                moveCameraToPlace(
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
                              controller: _controller,
                              onChanged: (query) {
                                performAutocompleteSearch(query);
                              },
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                hintText: 'Search for a place or mosque'.tr,
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  highlightColor: Colors.transparent,
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _controller.clear();
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
                              moveCameraToPlace(_searchResults[index].placeId!);
                              setState(
                                () {
                                  _controller.text =
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
              const BuildProduct(),
              BuildChooseButton(
                "location",
                totalOrder,
                selectedOrders,
              )
            ],
          ),
          floatingActionButton: Stack(
            children: [
              Positioned(
                bottom: 355,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
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
                      googleMapController.animateCamera(
                        CameraUpdate.newLatLng(
                          const LatLng(25, 45),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.gps_fixed,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 280,
                right: 0,
                child: Container(
                  width: 30,
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
                        height: 30,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          mini: true,
                          onPressed: () {
                            googleMapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 10,
                        child: Divider(
                          color: Colors.black,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0,
                          mini: true,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            googleMapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 20,
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
      ),
    );
  }

  // DIALOGS
  showListDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Text(
            'Selected mosques'.tr,
            textDirection: TextDirection.rtl,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int index = 0; index < selectedMosques.length; index++)
                      ListTile(
                        key: Key(
                            'mosque_$index'), // Unique key for each ListTile
                        title: Text(selectedMosques[index],
                            textDirection: TextDirection.rtl),
                        leading: IconButton(
                          highlightColor: Colors.transparent,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              removeMarkerOfMosque(selectedMosques[index]);
                              selectedMosques.removeAt(index);
                              if (selectedMosques.isEmpty) {
                                Navigator.of(context).pop();
                                FocusScope.of(context).unfocus();
                              }
                            });
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              },
              child: Text('Cancel'.tr),
            ),
          ],
        );
      },
    );
  }

  Future<void> showMosqueDialog(String mosqueName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Text(mosqueName, textDirection: TextDirection.rtl),
          actions: [
            TextButton(
              onPressed: () {
                // Add the mosque to the selectedMosques list
                addMosqueToList(mosqueName);
                addMarkerToMosque(mosqueName);
                FocusScope.of(context).unfocus();
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              },
              child: Text('Add the mosque to the list'.tr),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              },
              child: Text('Cancel'.tr),
            ),
          ],
        );
      },
    );
  }

  void addMosqueToList(String mosqueName) {
    if (!selectedMosques.contains(mosqueName)) {
      setState(() {
        selectedMosques.add(mosqueName);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The mosque is already on the list'.tr),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // MARKERS
  void removeMarkerOfMosque(String mosqueName) async {
    _markers.add(
      Marker(
        markerId: MarkerId(mosqueName),
        position: getMosqueLocation(mosqueName),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/images/1.jpg'),
        onTap: () {
          showMosqueDialog(mosqueName);
        },
      ),
    );
    setState(() {});
  }

  void _updateMarkers(List<PlacesSearchResult> places) async {
    if (places.isNotEmpty) {
      for (var place in places) {
        double lat = place.geometry!.location.lat;
        double lng = place.geometry!.location.lng;
        String name = place.name;

        _markers.add(
          Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: name,
              snippet: place.vicinity,
            ),
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(), 'assets/images/1.jpg'),
            onTap: () {
              showMosqueDialog(name);
            },
          ),
        );
      }
    }
    setState(() {});
  }

  void addMarkerToMosque(String mosqueName) async {
    LatLng mosqueLocation = getMosqueLocation(mosqueName);
    _markers.add(
      Marker(
        markerId: MarkerId(mosqueName),
        position: mosqueLocation,
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/images/9.jpg'),
        onTap: () {
          showMosqueDialog(mosqueName);
        },
      ),
    );
    setState(() {});
  }

  LatLng getMosqueLocation(String mosqueName) {
    for (var marker in _markers) {
      if (marker.infoWindow.title == mosqueName) {
        return marker.position;
      }
    }
    return const LatLng(25, 45);
  }

  // SEARCH
  Future<void> performAutocompleteSearch(String query) async {
    try {
      LatLngBounds saudiArabiaBounds = LatLngBounds(
        southwest: const LatLng(16.456808125987084, 34.92532922317433),
        northeast: const LatLng(32.1048459480552, 51.0802984261652),
      );

      PlacesAutocompleteResponse response = await places.autocomplete(
        query,
        components: [
          Component(Component.country, 'SA'), // Restrict to Saudi Arabia
        ],
        language: 'ar',
        region: 'sa',
      );

      if (response.isOkay) {
        // Filter and fetch details for each prediction
        List<Prediction> filteredResults = [];

        for (Prediction prediction in response.predictions) {
          PlacesDetailsResponse details =
              await places.getDetailsByPlaceId(prediction.placeId!);

          if (details.isOkay) {
            Location location = details.result.geometry!.location;

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
    String query = _controller.text;
    if (query.isNotEmpty) {
      try {
        PlacesAutocompleteResponse response = await places.autocomplete(query);

        if (response.isOkay && response.predictions.isNotEmpty) {
          Prediction firstResult = response.predictions.first;
          moveCameraToPlace(firstResult.placeId!);
        } else {
          throw Exception('No results found');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }
  }

  Future<void> getPlaceDetails(String placeId) async {
    try {
      // Check if details are already in cache
      if (placeDetailsCache.containsKey(placeId)) {
        PlacesDetailsResponse details = placeDetailsCache[placeId]!;
        if (details.isOkay) {
          setState(() {
            _controller.text = details.result as String;
          });
          return;
        }
      }

      // Fetch details if not in cache
      PlacesDetailsResponse details = await places.getDetailsByPlaceId(
        placeId,
        language: 'ar',
        region: 'sa',
      );

      if (details.isOkay) {
        setState(() {
          _controller.text = details.result as String;
        });

        // Cache the result
        placeDetailsCache[placeId] = details;
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

  void clearSearchResults() {
    setState(() {
      _searchResults.clear();
    });
  }

  // FETCH & CACHE
  Future<void> _fetchMosques() async {
    List<PlacesSearchResult> allResults = [];

    for (var location in locations) {
      for (var keyword in keywords) {
        String cacheKey = '$keyword-${location.lat}-${location.lng}';

        // Get the file info from the cache
        FileInfo? fileInfo = await _cacheManager.getFileFromCache(cacheKey);

        // Check if the cached results exist or are expired (maxAgeCacheObject)
        if (fileInfo != null) {
          // Use cached results if available
          List<PlacesSearchResult> cachedResults =
              await _decodeCachedResults(fileInfo);
          allResults.addAll(cachedResults);
          log("data from cache");
        } else {
          // Perform a new search and cache the results
          PlacesSearchResponse response = await places.searchNearbyWithRadius(
            location,
            1500, // Radius in meters
            type: keyword,
            keyword: keyword,
          );

          allResults.addAll(response.results);

          // Cache the results with a very long expiration (effectively indefinite)
          await _cacheResults(
            cacheKey,
            response.results,
          );
          log("data from api");
        }
      }
    }

    _updateMarkers(allResults);
  }

  Future<void> _cacheResults(
      String cacheKey, List<PlacesSearchResult> results) async {
    await _cacheManager.putFile(
      cacheKey,
      Uint8List.fromList(utf8.encode(json.encode(results))),
      maxAge: const Duration(days: 36500), // Cache for approximately 100 years
    );
  }

  Future<List<PlacesSearchResult>> _decodeCachedResults(
      FileInfo fileInfo) async {
    String content = await fileInfo.file.readAsString();
    List<dynamic> decoded = json.decode(content);
    return decoded
        .map((result) => PlacesSearchResult.fromJson(result))
        .toList();
  }
}
