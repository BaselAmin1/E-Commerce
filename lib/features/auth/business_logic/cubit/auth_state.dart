// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInError extends AuthState {
  String error;
  SignInError({
    required this.error,
  });
}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  String error;
  RegisterError({
    required this.error,
  });
}
