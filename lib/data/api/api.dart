class Api {
  static const baseUrl = 'http://127.0.0.1:8000/api';
  //authentication
  static const register = baseUrl + '/register';
  static const login = baseUrl + '/login';
  static const resetPassword = baseUrl + '/forgot-password';
  //home
  static const home = baseUrl + '/';
  //all activities
  static const activities = baseUrl + '/activities';
  //get user info
  static const user = baseUrl + '/user';
  //get activity info
  static const activity = baseUrl + '/activity';
}
