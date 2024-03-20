import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mudad_app/model/orders_model.dart';
import 'package:mudad_app/services/remote_API/dio_helper.dart';
import 'package:mudad_app/services/remote_API/end_points.dart';
import 'package:mudad_app/services/remote_API/user_data.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  OrdersModel ordersModel = OrdersModel();

  static OrdersCubit get(context) => BlocProvider.of(context);

  submitOrder(String location, num total, List<Map<String, dynamic>> products)async {
    emit(OrdersLoading());
   await DioHelper.postData(endPoint: EndPoint.orders, data: {
      "location": location,
      "total": total,
      "products": products,
      "_id": User.id,
      "createdAt": DateTime.now().toString(),

    }).then((value) => (value) {print("sadsadsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
          // ordersModel = OrdersModel.fromJson(value.data);

        });
    emit(OrdersSubmitted());


  }

// updateUserOrders(String id , OrdersModel order){
//
// }
}
