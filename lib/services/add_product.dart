import 'package:dio/src/response.dart';
import 'package:mudad_app/model/remote_API/dio_helper.dart';
import 'package:mudad_app/model/remote_API/product_model.dart';


class Product {
  Future<Response> getProduct() async {
   
  Response data = await    DioHelper.getData( endPoint: "hh");
   return data;

  }
 
}
