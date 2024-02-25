import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitialState extends LocationState {}

class LocationInsidePolygonState extends LocationState {
  final LatLng location;

  const LocationInsidePolygonState(this.location);

  @override
  List<Object> get props => [location];
}

class LocationOutsidePolygonState extends LocationState {}

class LocationSavedState extends LocationState {
  final LatLng location;

  const LocationSavedState(this.location);

  @override
  List<Object> get props => [location];
}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final List<Prediction> searchResults;

  const LocationSuccess(this.searchResults);

  @override
  List<Object> get props => [searchResults];
}

class LocationErrorState extends LocationState {
  final String message;

  const LocationErrorState(this.message);

  @override
  List<Object> get props => [message];
}
