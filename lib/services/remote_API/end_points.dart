import 'package:mudad_app/services/remote_API/dio_helper.dart';

class EndPoint{
  // static const String loginUrl = "auth/login";
  static String userToken = "loginToken";
  static String services = "services";
static String products = "products";
static String orders = "${DioHelper.baseUrl}orders";

  // static int id = LoginCubit.loginId;
  // static String  name = "";
  // static String registerUrl = "auth/register";
  // static String selectJobUrl = "user/profile";
  // static String editProfile = "user/profile/edit/$id}";
  // static String uploadPortofolio = "user/profile/portofolios/$id";
}