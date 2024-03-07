import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mudad_app/model/service_model.dart';
import 'package:mudad_app/services/remote_API/dio_helper.dart';
import 'package:mudad_app/services/remote_API/end_points.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServiceModel serviceModel = ServiceModel();
  List<String> services = [];
  List<String> serviceImage = [];

  ServicesCubit() : super(ServicesInitial());

  loadServices() {
    emit(ServicesLoading());
    DioHelper.getData(endPoint: DioHelper.baseUrl + EndPoint.services)
        .then((value) {
      if (value.statusCode == 200) {
        serviceModel = ServiceModel.fromJson(value.data);
        serviceImage.clear();
        services.clear();
        for (var element in serviceModel.body!) {
          services.add(element.title.toString());
          serviceImage.add(element.imageUrl.toString());
        }
        emit(ServicesSuccess(services, serviceImage));
      } else {
        emit(ServicesFailure());
      }
    });

    // emit(ServicesSuccess());
  }
}
