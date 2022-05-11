import 'package:bloc/bloc.dart';
import 'package:fit_bharat_family/data/models/user.dart';
import 'package:fit_bharat_family/data/providers/auth_provider.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({required this.authProvider}) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpInProgressState());
      bool isSuccess = await authProvider.signUp(event.user);
      if (isSuccess) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpFailureState());
      }
    });
  }
}
