part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserModel? userModel;
  final bool isFetching;
  final bool isSaveSuccess;
  final bool isSaveFailure;

  const ProfileState({
    this.userModel,
    this.isFetching = false,
    this.isSaveSuccess = false,
    this.isSaveFailure = false,
  });

  @override
  List<Object?> get props => [
        userModel,
        isFetching,
        isSaveSuccess,
        isSaveFailure,
      ];

  ProfileState copyWith({
    UserModel? userModel,
    bool? isFetching,
    bool? isSaveSuccess,
    bool? isSaveFailure,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      isFetching: isFetching ?? this.isFetching,
      isSaveSuccess: isSaveSuccess ?? this.isSaveSuccess,
      isSaveFailure: isSaveFailure ?? this.isSaveFailure,
    );
  }
}
