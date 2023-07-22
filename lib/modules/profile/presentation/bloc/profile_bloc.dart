import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/modules/profile/data/user_model.dart';

part 'profile_event.dart';

part 'profile_state.dart';

const userFake = UserModel(
  username: "nguyen.van",
  fullname: "Nguyen Van A",
  email: "nguyenvana@mail.com",
  phone: "0123456789",
  gender: "male",
);

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileFetchEvent>(_onFetchEvent);
    on<ProfileUpdateEvent>(_onUpdateEvent);
  }

  Future<void> _onFetchEvent(
    ProfileFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isFetching: true));
    try {
      await Future.delayed(const Duration(seconds: 2));

      /// TODO: FAKE data for testing
      UserModel userModel = userFake;
      return emit(state.copyWith(
        isFetching: false,
        userModel: userModel,
      ));
    } catch (e) {
      return emit(state.copyWith(
        isFetching: false,
        isSaveFailure: true,
      ));
    }
  }

  void _onUpdateEvent(
    ProfileUpdateEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(userModel: event.userModel));
  }
}
