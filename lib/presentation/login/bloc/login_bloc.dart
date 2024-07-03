import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/user_model.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserUseCase userUseCase;

  LoginBloc(this.userUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonPressed) {
        try {
          emit(LoginLoading());
          final List<UserModel> user = await userUseCase.loginUser(
            username: event.username,
            password: event.password,
          );
          emit(LoginSuccess(user: user));
        } catch (e) {
          emit(LoginFailure(message: e.toString()));
        }
      }
    });
  }
}
