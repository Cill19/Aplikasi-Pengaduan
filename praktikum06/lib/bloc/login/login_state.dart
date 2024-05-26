part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String msg;
  LoginSuccess(this.msg);
}

class LoginFailure extends LoginState {
  final String msg;
  LoginFailure(this.msg);
}
