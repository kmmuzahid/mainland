class ApiEndPoint {
  ApiEndPoint._();
  static final ApiEndPoint instance = ApiEndPoint._();

  final String domain = 'http://10.10.7.102:4000';
  final String baseUrl = 'http://10.10.7.102:4000/api/v1';
  final String soketUrl = 'http://10.10.7.102:4000/api/v1';

  //auth
  final String signUp = '/user/create';
  final String signIn = '/auth/login';
  final String verifyEmail = '/auth/verify-email';
  final String forgetPassword = '/auth/forget-password';
  final String changePassword = '/auth/change-password';
  final String resetPassword = '/auth/reset-password';

  final String signOut = '/auth/sign-out';

  //user
  final String getUser = '/user/profile';
}
