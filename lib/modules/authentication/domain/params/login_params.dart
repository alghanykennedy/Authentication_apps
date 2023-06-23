class LoginParams {
  String email;
  String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  factory LoginParams.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Invalid JSON data');
    }
    return LoginParams(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
