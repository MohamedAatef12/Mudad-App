import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mudad_app/services/remote_API/dio_helper.dart';
import 'package:mudad_app/services/remote_API/end_points.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  submitOrder(String location,num total,List<Map<String,dynamic>> products){
    emit(OrdersLoading());
      DioHelper.postData(endPoint: EndPoint.orders, data: {
        "location": location,
        "total": total,
        "products": products
      });
    emit(OrdersSubmitted());
  }

}
