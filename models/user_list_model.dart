class UserList {
  UserList({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"] ?? '',
        email: json["email"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        avatar: json["avatar"] ?? '',
      );

  /// Use toJson Method only if needed

}
