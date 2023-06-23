class ApiEndPoints {
  static const String baseUrl = 'http://restapi.adequateshop.com/api/';
  static var authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginEmail = 'authaccount/login';
  final String registerEmail = 'authaccount/registration';
  final String userList = 'users';
}
