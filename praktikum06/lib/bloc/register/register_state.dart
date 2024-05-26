part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String msg;
  RegisterSuccess(this.msg);
}

class RegisterFailure extends RegisterState {
  final String msg;
  RegisterFailure(this.msg);
}
