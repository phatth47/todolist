part of 'update_profile_bloc.dart';

abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();
}

class UpdateProfileInitEvent extends UpdateProfileEvent {
  final UserModel? userModel;

  const UpdateProfileInitEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}

class UpdateProfileChangeGender extends UpdateProfileEvent {
  final GenderType? genderType;

  const UpdateProfileChangeGender({
    required this.genderType,
  });

  @override
  List<Object?> get props => [genderType];
}

class UpdateProfileSaveEvent extends UpdateProfileEvent {
  final UserModel userModel;

  const UpdateProfileSaveEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}
