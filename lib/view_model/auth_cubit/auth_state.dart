part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  String userID,UserName,UserToken,UserphoneNum,UserEmail;

  LoginSuccessState(
      this.userID, this.UserName, this.UserToken, this.UserphoneNum,this.UserEmail);
}

class LoginErrorState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  // String token;
  // RegisterSuccessState(this.token);
}

class RegisterErrorState extends AuthState {}
