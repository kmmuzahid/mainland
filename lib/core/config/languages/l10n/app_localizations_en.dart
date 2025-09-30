// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Mainland';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String get invalidPassword =>
      'Password must be at least 8 characters long, contain an uppercase letter, and a digit';

  @override
  String get invalidDate => 'Please enter a valid date (YYYY-MM-DD)';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get invalidURL => 'Please enter a valid URL';

  @override
  String get invalidNumber => 'Please enter a valid number';

  @override
  String get invalidCreditCard =>
      'Please enter a valid credit card number (16 digits)';

  @override
  String get invalidPostalCode => 'Please enter a valid postal code';

  @override
  String minLengthError(Object minLength) {
    return 'Input must be at least $minLength characters';
  }

  @override
  String maxLengthError(Object maxLength) {
    return 'Input must be no more than $maxLength characters';
  }

  @override
  String get invalidPattern => 'Input does not match the required pattern';

  @override
  String invalidDateRange(Object endDate, Object startDate) {
    return 'Date must be between $startDate and $endDate';
  }

  @override
  String otpEntrySubtitle(Object username) {
    return 'Otp has been sent to $username';
  }

  @override
  String get alphaNumericError => 'Only alphanumeric characters are allowed';

  @override
  String get usernameError =>
      'Username must be between 3 to 15 characters and can only contain letters, numbers, and underscores';

  @override
  String get invalidTime => 'Please enter a valid time in HH:mm format';

  @override
  String get invalidOTP => 'Please enter a valid 6-digit OTP';

  @override
  String get invalidCurrency => 'Please enter a valid amount (e.g., 1234.56)';

  @override
  String get invalidIP => 'Please enter a valid IPv4 address';

  @override
  String get allDataLoaded => 'All data loaded';

  @override
  String get nidRequired => 'National ID is required.';

  @override
  String get nidInvalid => 'Please enter a valid National ID (12 digits).';

  @override
  String get fullNameRequired => 'Full name is required.';

  @override
  String get fullNameInvalid =>
      'Please enter a valid full name (e.g., John Doe, O\'Connor, Mary-Jane).';

  @override
  String get seconds => 'Seconds';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get resendCodeIn => 'Resend code in';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get save => 'Save';

  @override
  String get enterVerifyCode => 'Enter Verify Code';

  @override
  String get otpTitleSignup => 'OTP Verification';

  @override
  String get profileInfo => 'Profile Info';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get password => 'Password';

  @override
  String get forgotThePassword => 'Forgot the Password?';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get doNotHaveAccount => 'Do not have an account?';

  @override
  String get accountDeleteMessage =>
      'Are you sure you want to delete your account?';

  @override
  String get otpSendButton => 'Send OTP';

  @override
  String get didntReciveCode => 'Didn\'t receive code?';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get deleteUser => 'Delete User';

  @override
  String get blockUser => 'Block User';

  @override
  String get verify => 'Verify';

  @override
  String get message => 'Message';

  @override
  String get notifications => 'Notifications';

  @override
  String get privacyPolicy => 'Privacy Notice';

  @override
  String get termsCondition => 'Terms of Use';

  @override
  String get account => 'Account';

  @override
  String codeHasBeenSentTo(Object email) {
    return 'Code has been sent to $email';
  }

  @override
  String get yes => 'Yes';

  @override
  String get noDetailsAvailableForThisNotification =>
      'No details available for this notification';

  @override
  String get no => 'No';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get buySellKeepFavoriteTickets =>
      'Buy, Sell, and Keep your Favorite Tickets';

  @override
  String get copyright => '©2025 Essence Software. All rights reserved.';

  @override
  String get letsSignYouIn => 'Let’s sign you in';

  @override
  String get welcomeBack => 'Welcome back.';

  @override
  String get youHaveBeenMissed => 'You have been missed!';

  @override
  String get pleaseSelectARoleBeforeContinuing =>
      'Please select a role before continuing';

  @override
  String get attendee => 'Attendee';

  @override
  String get organizer => 'Organizer';

  @override
  String get resetPassword => 'Reset Password';
}
