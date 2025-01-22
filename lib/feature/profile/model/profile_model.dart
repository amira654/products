class User {
  final ProfileModel profileModel;

  User({required this.profileModel});
  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(profileModel: ProfileModel.fromJson(jsonData['user']));
  }
}

class ProfileModel {
  final String nationalId;
  final String name;
  final String phone;
  final String email;
  final String profileImage;

  ProfileModel(
      {required this.nationalId,
      required this.name,
      required this.phone,
      required this.email,
      required this.profileImage});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        nationalId: json['nationalId'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        profileImage: json['profileImage']);
  }
}
