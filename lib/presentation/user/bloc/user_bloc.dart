import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/user_model.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;

  UserBloc(this.userUseCase) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserLogin) {
        try {
          emit(LoginLoading());
          final List<UserModel> user = await userUseCase.loginUser(
            username: event.username,
            password: event.password,
          );
          if (user.isEmpty) {
            emit(LoginFailure(message: 'User not found'));
            return;
          } else {
            userUseCase.saveUserData(user.first);
            userUseCase.setLoginState(true);
            emit(LoginSuccess(user: user));
          }
        } catch (e) {
          emit(LoginFailure(message: e.toString()));
        }
      } else if (event is UserRegister) {
        try {
          emit(RegisterLoading());
          final UserModel? user = await userUseCase.registerUser(
            name: event.name,
            email: event.email,
            username: event.username,
            password: event.password,
          );
          if (user == null) {
            emit(RegisterFailure(message: 'User not found'));
            return;
          } else {
            userUseCase.saveUserData(user);
            userUseCase.setLoginState(true);
            emit(RegisterSuccess(user: user));
          }
        } catch (e) {
          emit(RegisterFailure(message: e.toString()));
        }
      }
    });
  }
}
