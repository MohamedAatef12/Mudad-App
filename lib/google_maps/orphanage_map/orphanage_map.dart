// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
//
// import 'build_locations_buttons.dart';
//
// class OrphanageMap extends StatefulWidget {
//   const OrphanageMap({Key? key}) : super(key: key);
//
//   @override
//   State<OrphanageMap> createState() => _OrphanageMapState();
// }
//
// late GoogleMapController controller;
// final List<Marker> _markers = [];
// final places =
//     GoogleMapsPlaces(apiKey: 'AIzaSyDu184vis9uZwt9OqWD6AosFbBLDnPxsQ0');
// List<Prediction> _searchResults = [];
// final List<String> selectedOrphanage = [];
// List<Location> locationsOrphanage = [
//   Location(lat: 21.423888489772935, lng: 39.82624903841808), // Makkah
//   Location(lat: 24.467663304009072, lng: 39.61106777648205), // Madinah
//   Location(lat: 21.52774807596778, lng: 39.16439325129956), // Jeddah
// ];
//
// class _OrphanageMapState extends State<OrphanageMap> {
//   final TextEditingController searchController = TextEditingController();
//   final DefaultCacheManager _cacheOrphanageManager = DefaultCacheManager();
//   final Map<String, PlacesDetailsResponse> placeDetailsOrphanageCache = {};
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _fetchOrphanages();
//   }
//
//   final List<String> keywords = [
//     'orphanage',
//     'دار أيتام',
//     'الأيتام',
//     'دور الأيتام',
//     'ملجأ الأيتام',
//     'orphan care center',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(child: SizedBox()
//
//         // ModalProgressHUD(
//         //   inAsyncCall: isLoading,
//         //   opacity: 0.5,
//         //   progressIndicator: const SpinKitFadingCircle(
//         //     color: Color(0xFF609FD8),
//         //     size: 50.0,
//         //   ),
//         //   child: Scaffold(
//         //     resizeToAvoidBottomInset: false,
//         //     body: ModalProgressHUD(
//         //       inAsyncCall: isLoading,
//         //       opacity: 0.5,
//         //       progressIndicator: const SpinKitFadingCircle(
//         //         color: Color(0xFF609FD8),
//         //         size: 50.0,
//         //       ),
//         //       child: Stack(
//         //         children: [
//         //           GoogleMap(
//         //             onMapCreated: (GoogleMapController c) {
//         //               controller = c;
//         //             },
//         //             initialCameraPosition: const CameraPosition(
//         //               target: LatLng(25, 45),
//         //               zoom: 5,
//         //             ),
//         //             markers: Set<Marker>.from(_markers),
//         //             cameraTargetBounds: CameraTargetBounds(
//         //               LatLngBounds(
//         //                 southwest:
//         //                     const LatLng(17.607613374386183, 37.98344273015662),
//         //                 northeast:
//         //                     const LatLng(32.1048459480552, 51.0802984261652),
//         //               ),
//         //             ),
//         //             zoomControlsEnabled: false, // Disable default zoom controls
//         //             myLocationButtonEnabled:
//         //                 false, // Disable default location button
//         //             zoomGesturesEnabled: true,
//         //             onTap: (LatLng latLng) {
//         //               // Dismiss the keyboard and clear search results on map tap
//         //               if (_searchResults.isNotEmpty) {
//         //                 clearSearchResults();
//         //                 FocusScope.of(context).unfocus();
//         //               } else {
//         //                 FocusScope.of(context).unfocus();
//         //               }
//         //             },
//         //           ),
//         //           Positioned(
//         //             top: MediaQuery.of(context).size.height / 40,
//         //             left: 0,
//         //             child: IconButton(
//         //               highlightColor: Colors.transparent,
//         //               onPressed: () => Get.back(),
//         //               icon: const Icon(
//         //                 Icons.arrow_back_ios_new,
//         //                 color: Color(0xFF609FD8),
//         //                 size: 40,
//         //               ),
//         //             ),
//         //           ),
//         //           const BuildLocationsOrphanageButtons(),
//         //           if (selectedOrphanage.isNotEmpty)
//         //             Positioned(
//         //               top: MediaQuery.of(context).size.height / 10,
//         //               right: MediaQuery.of(context).size.width / 5,
//         //               left: MediaQuery.of(context).size.width / 5,
//         //               child: Container(
//         //                 padding: const EdgeInsets.symmetric(
//         //                     vertical: 2, horizontal: 16.0),
//         //                 decoration: BoxDecoration(
//         //                   color: Colors.white,
//         //                   borderRadius: BorderRadius.circular(8.0),
//         //                 ),
//         //                 child: Row(
//         //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //                   children: [
//         //                     ElevatedButton(
//         //                       style: ButtonStyle(
//         //                         shape: MaterialStateProperty.all(
//         //                           RoundedRectangleBorder(
//         //                             borderRadius: BorderRadius.circular(8.0),
//         //                           ),
//         //                         ),
//         //                       ),
//         //                       onPressed: () {
//         //                         showListOrphanageDialog();
//         //                       },
//         //                       child: const Text('عرض'),
//         //                     ),
//         //                     Text(
//         //                         'دور الايتام المختارة: ${selectedOrphanage.length}'),
//         //                   ],
//         //                 ),
//         //               ),
//         //             ),
//         //           Positioned(
//         //             top: 15,
//         //             right: 5,
//         //             left: 55,
//         //             child: Column(
//         //               children: [
//         //                 Container(
//         //                   decoration: BoxDecoration(
//         //                     color: const Color(0xFFE2E1E1),
//         //                     borderRadius: BorderRadius.circular(20),
//         //                   ),
//         //                   child: Row(
//         //                     children: [
//         //                       const SizedBox(
//         //                         width: 10,
//         //                       ),
//         //                       GestureDetector(
//         //                         onTap: () {
//         //                           if (_searchResults.isNotEmpty) {
//         //                             moveCameraToOrphanagePlace(
//         //                                 _searchResults.first.placeId!);
//         //                           } else {
//         //                             moveCameraToPlaceFromText();
//         //                           }
//         //                           FocusScope.of(context).unfocus();
//         //                         },
//         //                         child: Container(
//         //                           height: 45,
//         //                           width: 45,
//         //                           decoration: BoxDecoration(
//         //                             color: const Color(0xFF609FD8),
//         //                             borderRadius: BorderRadius.circular(15),
//         //                           ),
//         //                           child: const Icon(
//         //                             Icons.search,
//         //                             color: Colors.white,
//         //                             size: 30.0,
//         //                           ),
//         //                         ),
//         //                       ),
//         //                       Container(
//         //                         decoration: BoxDecoration(
//         //                           color: Colors.white,
//         //                           borderRadius: BorderRadius.circular(15),
//         //                         ),
//         //                         margin: const EdgeInsets.all(10),
//         //                         width: MediaQuery.of(context).size.width / 1.5,
//         //                         child: TextFormField(
//         //                           controller: searchController,
//         //                           onChanged: (query) {
//         //                             performAutocompleteOrphanageSearch(query);
//         //                           },
//         //                           textDirection: TextDirection.rtl,
//         //                           textAlign: TextAlign.right,
//         //                           textCapitalization: TextCapitalization.words,
//         //                           decoration: InputDecoration(
//         //                             hintText: 'ابحث عن دور الايتام',
//         //                             border: InputBorder.none,
//         //                             suffixIcon: IconButton(
//         //                               highlightColor: Colors.transparent,
//         //                               icon: const Icon(Icons.clear),
//         //                               onPressed: () {
//         //                                 searchController.clear();
//         //                                 clearSearchResults();
//         //                               },
//         //                             ),
//         //                           ),
//         //                         ),
//         //                       ),
//         //                     ],
//         //                   ),
//         //                 ),
//         //                 const SizedBox(height: 10),
//         //                 Container(
//         //                   height: _searchResults.length * 60.0,
//         //                   decoration: BoxDecoration(
//         //                     color: Colors.white,
//         //                     borderRadius: BorderRadius.circular(8.0),
//         //                   ),
//         //                   child: ListView.builder(
//         //                     itemCount: _searchResults.length,
//         //                     itemBuilder: (context, index) {
//         //                       return ListTile(
//         //                         title: Text(_searchResults[index].description!),
//         //                         onTap: () {
//         //                           getOrphanagePlaceDetails(
//         //                               _searchResults[index].placeId!);
//         //                           moveCameraToOrphanagePlace(
//         //                               _searchResults[index].placeId!);
//         //                           setState(
//         //                             () {
//         //                               searchController.text =
//         //                                   _searchResults[index].description!;
//         //                               clearSearchResults();
//         //                               FocusScope.of(context).unfocus();
//         //                             },
//         //                           );
//         //                         },
//         //                       );
//         //                     },
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //            BuildProduct(),
//         //           const BuildChooseButton()
//         //         ],
//         //       ),
//         //     ),
//         //     floatingActionButton: Stack(
//         //       children: [
//         //         Positioned(
//         //           bottom: 355,
//         //           right: 0,
//         //           child: Container(
//         //             width: 30,
//         //             height: 30,
//         //             decoration: BoxDecoration(
//         //               color: Colors.white,
//         //               borderRadius: BorderRadius.circular(8.0),
//         //               boxShadow: const [
//         //                 BoxShadow(
//         //                   color: Colors.grey,
//         //                   blurRadius: 10,
//         //                   spreadRadius: 0,
//         //                   offset: Offset(1, 1),
//         //                 ),
//         //               ],
//         //             ),
//         //             child: FloatingActionButton(
//         //               shape: RoundedRectangleBorder(
//         //                 borderRadius: BorderRadius.circular(8.0),
//         //               ),
//         //               mini: true,
//         //               elevation: 0,
//         //               backgroundColor: Colors.white,
//         //               onPressed: () {
//         //                 controller.animateCamera(
//         //                   CameraUpdate.newLatLng(
//         //                     const LatLng(25, 45),
//         //                   ),
//         //                 );
//         //               },
//         //               child: const Icon(
//         //                 Icons.gps_fixed,
//         //                 color: Colors.black,
//         //                 size: 20,
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //         Positioned(
//         //           bottom: 280,
//         //           right: 0,
//         //           child: Container(
//         //             width: 30,
//         //             decoration: BoxDecoration(
//         //               color: Colors.white,
//         //               borderRadius: BorderRadius.circular(8.0),
//         //               boxShadow: const [
//         //                 BoxShadow(
//         //                   color: Colors.grey,
//         //                   blurRadius: 10,
//         //                   spreadRadius: 0,
//         //                   offset: Offset(1, 1),
//         //                 ),
//         //               ],
//         //             ),
//         //             child: Column(
//         //               children: [
//         //                 SizedBox(
//         //                   height: 30,
//         //                   child: FloatingActionButton(
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.circular(8.0),
//         //                     ),
//         //                     elevation: 0,
//         //                     backgroundColor: Colors.white,
//         //                     mini: true,
//         //                     onPressed: () {
//         //                       controller.animateCamera(
//         //                         CameraUpdate.zoomIn(),
//         //                       );
//         //                     },
//         //                     child: const Icon(
//         //                       Icons.add,
//         //                       color: Colors.black,
//         //                       size: 20,
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 const SizedBox(
//         //                   width: 20,
//         //                   height: 10,
//         //                   child: Divider(
//         //                     color: Colors.black,
//         //                     height: 0,
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   height: 30,
//         //                   child: FloatingActionButton(
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.circular(8.0),
//         //                     ),
//         //                     elevation: 0,
//         //                     mini: true,
//         //                     backgroundColor: Colors.white,
//         //                     onPressed: () {
//         //                       controller.animateCamera(
//         //                         CameraUpdate.zoomOut(),
//         //                       );
//         //                     },
//         //                     child: const Icon(
//         //                       Icons.remove,
//         //                       color: Colors.black,
//         //                       size: 20,
//         //                     ),
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         );
//   }
//
//   // DIALOGS
//   showListOrphanageDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           title: Text(
//             'Selected orphanages'.tr,
//             textDirection: TextDirection.rtl,
//           ),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     for (int index = 0;
//                         index < selectedOrphanage.length;
//                         index++)
//                       ListTile(
//                         key: Key(
//                             'orphanage$index'), // Unique key for each ListTile
//                         title: Text(selectedOrphanage[index],
//                             textDirection: TextDirection.rtl),
//                         leading: IconButton(
//                           highlightColor: Colors.transparent,
//                           icon: const Icon(Icons.delete),
//                           onPressed: () {
//                             setState(() {
//                               removeMarkerOfOrphanage(selectedOrphanage[index]);
//                               selectedOrphanage.removeAt(index);
//                               if (selectedOrphanage.isEmpty) {
//                                 Navigator.of(context).pop();
//                                 FocusScope.of(context).unfocus();
//                               }
//                             });
//                           },
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 FocusScope.of(context).unfocus();
//               },
//               child: Text('Cancel'.tr),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> showOrphanageDialog(String orphanageName) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           content: Text(orphanageName, textDirection: TextDirection.rtl),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Add the mosque to the selectedMosques list
//                 addOrphanageToList(orphanageName);
//                 addMarkerToOrphanage(orphanageName);
//                 FocusScope.of(context).unfocus();
//                 Navigator.of(context).pop();
//                 FocusScope.of(context).unfocus();
//               },
//               child: Text('Add the orphanages to the list'.tr),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 FocusScope.of(context).unfocus();
//               },
//               child: const Text('إلغاء'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void addOrphanageToList(String orphanageName) {
//     if (!selectedOrphanage.contains(orphanageName)) {
//       setState(() {
//         selectedOrphanage.add(orphanageName);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('The orphanage is already on the list'.tr),
//           duration: const Duration(seconds: 2),
//         ),
//       );
//     }
//   }
//
//   // MARKERS
//   void _updateMarkers(List<PlacesSearchResult> places) async {
//     if (places.isNotEmpty) {
//       for (var place in places) {
//         double lat = place.geometry!.location.lat;
//         double lng = place.geometry!.location.lng;
//         String name = place.name;
//
//         _markers.add(
//           Marker(
//             markerId: MarkerId(name),
//             position: LatLng(lat, lng),
//             infoWindow: InfoWindow(
//               title: name,
//               snippet: place.vicinity,
//             ),
//             icon: await BitmapDescriptor.fromAssetImage(
//                 const ImageConfiguration(), 'assets/images/8.jpg'),
//             onTap: () {
//               showOrphanageDialog(name);
//             },
//           ),
//         );
//       }
//     }
//     setState(() {});
//   }
//
//   void removeMarkerOfOrphanage(String orphanageName) async {
//     _markers.add(
//       Marker(
//         markerId: MarkerId(orphanageName),
//         position: getOrphanageLocation(orphanageName),
//         icon: await BitmapDescriptor.fromAssetImage(
//             const ImageConfiguration(), 'assets/images/8.jpg'),
//         onTap: () {
//           showOrphanageDialog(orphanageName);
//         },
//       ),
//     );
//     setState(() {});
//   }
//
//   void addMarkerToOrphanage(String orphanageName) async {
//     LatLng orphanageLocation = getOrphanageLocation(orphanageName);
//     _markers.add(
//       Marker(
//         markerId: MarkerId(orphanageName),
//         position: orphanageLocation,
//         icon: await BitmapDescriptor.fromAssetImage(
//             const ImageConfiguration(), 'assets/images/10.jpg'),
//         onTap: () {
//           showOrphanageDialog(orphanageName);
//         },
//       ),
//     );
//     setState(() {});
//   }
//
//   LatLng getOrphanageLocation(String orphanageName) {
//     for (var marker in _markers) {
//       if (marker.infoWindow.title == orphanageName) {
//         return marker.position;
//       }
//     }
//     return const LatLng(25, 45);
//   }
//
//   // SEARCH
//   Future<void> performAutocompleteOrphanageSearch(String query) async {
//     try {
//       LatLngBounds saudiArabiaBounds = LatLngBounds(
//         southwest: const LatLng(16.456808125987084, 34.92532922317433),
//         northeast: const LatLng(32.1048459480552, 51.0802984261652),
//       );
//
//       PlacesAutocompleteResponse response = await places.autocomplete(
//         query,
//         components: [
//           Component(Component.country, 'SA'), // Restrict to Saudi Arabia
//         ],
//         language: 'ar',
//         region: 'sa',
//       );
//
//       if (response.isOkay) {
//         // Filter and fetch details for each prediction
//         List<Prediction> filteredResults = [];
//
//         for (Prediction prediction in response.predictions) {
//           PlacesDetailsResponse details =
//               await places.getDetailsByPlaceId(prediction.placeId!);
//
//           if (details.isOkay) {
//             Location location = details.result.geometry!.location;
//
//             // Convert Location to LatLng
//             LatLng locationLatLng = LatLng(location.lat, location.lng);
//
//             if (saudiArabiaBounds.contains(locationLatLng)) {
//               filteredResults.add(prediction);
//             }
//           }
//         }
//         setState(() {
//           _searchResults = filteredResults;
//         });
//       } else {
//         throw Exception('Failed to fetch autocomplete results');
//       }
//     } catch (e) {
//       log('Error 4: $e');
//     }
//   }
//
//   Future<void> moveCameraToPlaceFromText() async {
//     String query = searchController.text;
//     if (query.isNotEmpty) {
//       try {
//         PlacesAutocompleteResponse response = await places.autocomplete(query);
//
//         if (response.isOkay && response.predictions.isNotEmpty) {
//           Prediction firstResult = response.predictions.first;
//           moveCameraToOrphanagePlace(firstResult.placeId!);
//         } else {
//           throw Exception('No results found');
//         }
//       } catch (e) {
//         log('Error 5: $e');
//       }
//     }
//   }
//
//   Future<void> getOrphanagePlaceDetails(String placeId) async {
//     try {
//       // Check if details are already in cache
//       if (placeDetailsOrphanageCache.containsKey(placeId)) {
//         PlacesDetailsResponse details = placeDetailsOrphanageCache[placeId]!;
//         if (details.isOkay) {
//           setState(() {
//             searchController.text = details.result as String;
//           });
//           return;
//         }
//       }
//
//       // Fetch details if not in cache
//       PlacesDetailsResponse details = await places.getDetailsByPlaceId(
//         placeId,
//         language: 'ar',
//         region: 'sa',
//       );
//
//       if (details.isOkay) {
//         setState(() {
//           searchController.text = details.result as String;
//         });
//
//         // Cache the result
//         placeDetailsOrphanageCache[placeId] = details;
//       } else {
//         throw Exception('Failed to fetch place details');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error: $e');
//       }
//       // Handle errors
//     }
//   }
//
//   void clearSearchResults() {
//     setState(() {
//       _searchResults.clear();
//     });
//   }
//
//   // FETCH & CACHE
//   Future<void> _fetchOrphanages() async {
//     // Set loading to true
//     setState(() {
//       isLoading = true;
//     });
//
//     List<PlacesSearchResult> allResults = [];
//
//     for (var location in locationsOrphanage) {
//       for (var keyword in keywords) {
//         String cacheKey = '$keyword-${location.lat}-${location.lng}';
//
//         // Get the file info from the cache
//         FileInfo? fileInfo =
//             await _cacheOrphanageManager.getFileFromCache(cacheKey);
//
//         // Check if the cached results exist or are expired (maxAgeCacheObject)
//         if (fileInfo != null) {
//           // Use cached results if available
//           List<PlacesSearchResult> cachedResults =
//               await _decodeCachedResults(fileInfo);
//           allResults.addAll(cachedResults);
//           log("data from cache");
//         } else {
//           // Perform a new search and cache the results
//           PlacesSearchResponse response = await places.searchNearbyWithRadius(
//             location,
//             2000, // Radius in meters
//             type: keyword,
//             keyword: keyword,
//           );
//
//           allResults.addAll(response.results);
//
//           // Cache the results with a very long expiration (effectively indefinite)
//           await _cacheResults(
//             cacheKey,
//             response.results,
//           );
//           log("data from api");
//         }
//       }
//     }
//
//     // Update markers
//     _updateMarkers(allResults);
//
//     // Set loading to false after data is fetched
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   Future<void> _cacheResults(
//       String cacheKey, List<PlacesSearchResult> results) async {
//     await _cacheOrphanageManager.putFile(
//       cacheKey,
//       Uint8List.fromList(utf8.encode(json.encode(results))),
//       maxAge: const Duration(days: 36500), // Cache for approximately 100 years
//     );
//   }
//
//   Future<List<PlacesSearchResult>> _decodeCachedResults(
//       FileInfo fileInfo) async {
//     String content = await fileInfo.file.readAsString();
//     List<dynamic> decoded = json.decode(content);
//     return decoded
//         .map((result) => PlacesSearchResult.fromJson(result))
//         .toList();
//   }
// }
