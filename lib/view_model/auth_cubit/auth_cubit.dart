import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mudad_app/model/auth_models/login_model.dart';
import 'package:mudad_app/model/auth_models/register_model.dart';
import 'package:mudad_app/services/remote_API/end_points.dart';
import '../../services/remote_API/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();
  RegisterModel registerModel = RegisterModel();
  String? userRegToken;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await DioHelper.postData(
          endPoint: EndPoint.loginUrl,
          data: {"email": email, "password": password}).then((value) {
        loginModel = LoginModel.fromJson(value.data);

        print(loginModel.body!.dDoc!.name);
      });
      emit(LoginSuccessState(
        loginModel.body!.dDoc!.sId.toString(),
        loginModel.body!.dDoc!.name.toString(),
        loginModel.body!.token.toString(),
        loginModel.body!.dDoc!.phoneNumber.toString(),
        loginModel.body!.dDoc!.email.toString(),
      ));
    } catch (e) {
      print(e.toString());
      emit(LoginErrorState());
    }
  }

  Future<void> register(
      String name, String email, String phone, String password) async {
    emit(RegisterLoadingState());
    try {
      await DioHelper.postData(endPoint: EndPoint.registerUrl, data: {
        "name": name,
        "email": email,
        "password": password,
        "phoneNumber": phone
      }).then((value) {
        registerModel = RegisterModel.fromJson(value.data);
        // userRegToken = registerModel.body!.token;
        // print(userRegToken);
      });
      emit(RegisterSuccessState());
    } catch (e) {
      print(e.toString());
      emit(RegisterErrorState());
    }
  }
}
