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
  final String resendOtp = '/auth/resend-otp';
  final String signOut = '/auth/sign-out';

  //user
  final String profile = '/user/profile';

  //basic
  final String privacyPolicy = '/settings/privacyPolicy';
  final String termsAndConditions = '/settings/termsAdnCondition';

  //event
  final String createEvent = '/event';
  String updateEvent(String id) => '/event/$id';

  //category + subcategory
  final String category = '/event/allCategory';
  String subCategory(String id) => '/event/Subcategory?categoryId=$id';

  //event
  final String orgEvent = '/event'; //only self event
  final String orgEventClosed = '/event/closed';
  String eventDetails({required String id}) => '/event/$id';

  //settings
  final String about_us = '/settings/about_us';
  final String contact_us = '/settings/contact_us';
}
