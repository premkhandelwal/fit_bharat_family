part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final User user;
  SignUpEvent({
    required this.user,
  });
}
