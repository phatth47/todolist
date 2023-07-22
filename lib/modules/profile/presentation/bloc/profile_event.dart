part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileFetchEvent extends ProfileEvent {
  const ProfileFetchEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUpdateEvent extends ProfileEvent {
  final UserModel userModel;

  const ProfileUpdateEvent({
    required this.userModel,
  });

  @override
  List<Object?> get props => [userModel];
}
