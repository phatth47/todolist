class UserModel {
  final String? fullname;
  final String? username;
  final String? email;
  final String? phone;
  final String? gender;

  const UserModel({
    this.fullname,
    this.username,
    this.email,
    this.phone,
    this.gender,
  });

  UserModel copyWith({
    String? fullname,
    String? username,
    String? email,
    String? phone,
    String? gender,
  }) {
    return UserModel(
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
    );
  }
}
