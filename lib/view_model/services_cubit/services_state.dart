part of 'services_cubit.dart';

abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSuccess extends ServicesState {
  List<String> services = [];
  List<String> images = [];

  ServicesSuccess(this.services, this.images);
}

class ServicesFailure extends ServicesState {}
