part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpSuccessState extends AuthState{}

class SignUpFailureState extends AuthState{}

class SignUpInProgressState extends AuthState{}