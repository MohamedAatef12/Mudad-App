import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mudad_app/model/products_model.dart';
import 'package:mudad_app/services/remote_API/end_points.dart';

import '../../services/remote_API/dio_helper.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  static ProductsCubit get(context) => BlocProvider.of(context);

  ProductsCubit() : super(ProductsInitial());
  ProductsModel productsModel = ProductsModel();
  List<String> products = [];
  List<int> price = [];
  List<String> images = [];
  List<int> quantity=[];
  List<int> quantityCounter=[];


  loadProducts() {
    emit(ProductsLoading());
    DioHelper.getData(endPoint: DioHelper.baseUrl+EndPoint.products)
        .then((value) {
      if (value.statusCode == 200) {
        productsModel = ProductsModel.fromJson(value.data);
        products.clear();
        price.clear();
        images.clear();

        for (var element in productsModel.body!) {
          products.add(element.title.toString());
          price.add(element.price!.toInt());
          images.add(element.imageUrl.toString());
          quantity.add(element.qty!.toInt());
        }
        emit(ProductsSuccess(products,images,price,quantity));
        print(products);
      }else {
        emit(ProductsFailure());
      }
    });
  }

   int addProducts(int qty){
     emit(ProductsAdded());
     return qty + 1;
   }

  removeProducts(int qty){
    emit(ProductsRemoved());

    return qty==0? 0:qty - 1;
  }


}
