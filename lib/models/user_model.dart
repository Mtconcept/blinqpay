class UserModel {
  final String bio;
  final String photo;
  final String name;
  final String username;
  final String userId;

  UserModel(
      {required this.bio,
      required this.photo,
      required this.name,
      required this.username,
      required this.userId});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      bio: json['bio'] ?? "",
      photo: json['photo'] ?? "",
      name: json['name'] ?? '',
      username: json['username'] ?? "",
      userId: json['userId']);
}
