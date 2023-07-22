import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/modules/profile/data/user_model.dart';
import 'package:todolist/modules/profile/presentation/edit_profile.dart';

part 'update_profile_event.dart';

part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(const UpdateProfileState()) {
    on<UpdateProfileChangeGender>(_onChangeGenderEvent);
    on<UpdateProfileSaveEvent>(_onSaveEvent);
    on<UpdateProfileInitEvent>(_onInit);
  }

  void _onInit(
    UpdateProfileInitEvent event,
    Emitter<UpdateProfileState> emit,
  ) {
    emit(state.copyWith(
      userModel: event.userModel,
      genderSelected: event.userModel?.gender ?? "male",
    ));
  }

  void _onChangeGenderEvent(
    UpdateProfileChangeGender event,
    Emitter<UpdateProfileState> emit,
  ) {
    emit(state.copyWith(
      genderSelected: event.genderType?.name ?? "male",
    ));
  }

  Future<void> _onSaveEvent(
    UpdateProfileSaveEvent event,
    Emitter<UpdateProfileState> emit,
  ) async {
    emit(state.copyWith(isUpdating: true));
    try {
      /// IF server return true then emit new model
      UserModel userModel = event.userModel;
      return emit(state.copyWith(
        isUpdating: false,
        userModel: userModel,
        genderSelected: state.genderSelected,
        isSaveSuccess: true,
      ));
    } catch (e) {
      return emit(state.copyWith(
        isUpdating: false,
      ));
    }
  }
}
