import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<InitialEvent>(_mapInitialEventToState);
    on<AddEvent>(_mapAddEventToState);
    on<RemoveEvent>(_mapRemoveEventToState);
  }

  Future<void> _mapInitialEventToState(InitialEvent event, emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    return emit(DataState());
  }

  void _mapAddEventToState(AddEvent event, emit) {
    if (state is DataState) {
      final data = (state as DataState).data;
      emit(DataState(data: data + 1));
    }
  }

  void _mapRemoveEventToState(RemoveEvent event, emit) {
    if (state is DataState) {
      final data = (state as DataState).data;
      emit(DataState(data: data - 1));
    }
  }
}
