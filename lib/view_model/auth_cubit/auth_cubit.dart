import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mudad_app/model/auth_models/login_model.dart';
import '../../services/remote_API/dio_helper.dart';

part 'auth_state.dart';




class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();

  Future<void> login(String phone, String password) async {
    await DioHelper.postData(endPoint: "endPoint", data: {
      "phone": phone,
      "password": password
    }).then((value) {


    });

// }

  }
}