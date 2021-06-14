import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_auth_cubit.freezed.dart';
part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit()
      : super(
          UserAuthState.initial(),
        );

  Future<void> fetchInitialData() async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    if (nohp == null) {
      emit(
        state.copyWith(
          userToken: '123',
          authStatus: AuthStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          userToken: '123',
          authStatus: AuthStatus.failure,
        ),
      );
    }
  }
}
