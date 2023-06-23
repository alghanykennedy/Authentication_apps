class SignupParams {
  String name;
  String email;
  String password;

  SignupParams({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupParams.fromJson(Map<String, dynamic> json) => SignupParams(
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };
}
