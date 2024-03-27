import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  String name;

  LatLng latlng;

  PlaceModel({required this.name, required this.latlng});
}

 List<PlaceModel> places = [
  PlaceModel(
      name: "مسجد الميقات",
      latlng: const LatLng(24.414013645094666, 39.5346728129157)),
  PlaceModel(
      name: " Dhul Hulaifah Miqat",
      latlng: const LatLng(24.413776747557066, 39.54301313947758)),
  PlaceModel(
      name: "مسجد مستشفي الميقات",
      latlng: const LatLng(24.41389488161571, 39.53532596177736)),
  PlaceModel(
      name: "مسجد محطة الميقات",
      latlng: const LatLng(22.78716238890705, 39.790388968524624)),
  PlaceModel(
      name: "Miqat Taif",
      latlng: const LatLng(21.346360610122247, 40.32711182434885)),
  PlaceModel(
      name: "مسجد وميقات وادى محرم    ",
      latlng: const LatLng(21.346893208074327, 40.326639398991595)),
  PlaceModel(
      name: " Miqat Wadi Al Mehrim",
      latlng: const LatLng(21.346613904851623, 40.32763886600539)),
  PlaceModel(
      name: "جامع و ميقات وادى محرم الهد",
      latlng: const LatLng(21.34604618845823, 40.327565744431084)),
  PlaceModel(
      name: "مسجد وميقات وادى محرم",
      latlng: const LatLng(21.346893208074327, 40.326639398991595)),

];
