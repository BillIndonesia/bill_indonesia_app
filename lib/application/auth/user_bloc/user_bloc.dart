import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {}
}
