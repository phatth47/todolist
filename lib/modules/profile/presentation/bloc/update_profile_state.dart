part of 'update_profile_bloc.dart';

class UpdateProfileState extends Equatable {
  final UserModel? userModel;
  final bool isUpdating;
  final bool isSaveSuccess;
  final String genderSelected;

  const UpdateProfileState({
    this.userModel,
    this.isUpdating = false,
    this.isSaveSuccess = false,
    this.genderSelected = "male",
  });

  @override
  List<Object?> get props => [
        userModel,
        isUpdating,
        isSaveSuccess,
        genderSelected,
      ];

  UpdateProfileState copyWith({
    UserModel? userModel,
    bool? isUpdating,
    bool? isSaveSuccess,
    String? genderSelected,
  }) {
    return UpdateProfileState(
      userModel: userModel ?? this.userModel,
      isUpdating: isUpdating ?? this.isUpdating,
      isSaveSuccess: isSaveSuccess ?? this.isSaveSuccess,
      genderSelected: genderSelected ?? this.genderSelected,
    );
  }
}
