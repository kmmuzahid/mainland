import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Mainland'**
  String get appName;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long, contain an uppercase letter, and a digit'**
  String get invalidPassword;

  /// No description provided for @invalidDate.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid date (YYYY-MM-DD)'**
  String get invalidDate;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @invalidURL.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get invalidURL;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get invalidNumber;

  /// No description provided for @invalidCreditCard.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid credit card number (16 digits)'**
  String get invalidCreditCard;

  /// No description provided for @invalidPostalCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid postal code'**
  String get invalidPostalCode;

  /// No description provided for @minLengthError.
  ///
  /// In en, this message translates to:
  /// **'Input must be at least {minLength} characters'**
  String minLengthError(Object minLength);

  /// No description provided for @maxLengthError.
  ///
  /// In en, this message translates to:
  /// **'Input must be no more than {maxLength} characters'**
  String maxLengthError(Object maxLength);

  /// No description provided for @invalidPattern.
  ///
  /// In en, this message translates to:
  /// **'Input does not match the required pattern'**
  String get invalidPattern;

  /// No description provided for @invalidDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date must be between {startDate} and {endDate}'**
  String invalidDateRange(Object endDate, Object startDate);

  /// No description provided for @otpEntrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Otp has been sent to {username}'**
  String otpEntrySubtitle(Object username);

  /// No description provided for @alphaNumericError.
  ///
  /// In en, this message translates to:
  /// **'Only alphanumeric characters are allowed'**
  String get alphaNumericError;

  /// No description provided for @usernameError.
  ///
  /// In en, this message translates to:
  /// **'Username must be between 3 to 15 characters and can only contain letters, numbers, and underscores'**
  String get usernameError;

  /// No description provided for @invalidTime.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid time in HH:mm format'**
  String get invalidTime;

  /// No description provided for @invalidOTP.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 6-digit OTP'**
  String get invalidOTP;

  /// No description provided for @invalidCurrency.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount (e.g., 1234.56)'**
  String get invalidCurrency;

  /// No description provided for @invalidIP.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid IPv4 address'**
  String get invalidIP;

  /// No description provided for @allDataLoaded.
  ///
  /// In en, this message translates to:
  /// **'All data loaded'**
  String get allDataLoaded;

  /// No description provided for @nidRequired.
  ///
  /// In en, this message translates to:
  /// **'National ID is required.'**
  String get nidRequired;

  /// No description provided for @nidInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid National ID (12 digits).'**
  String get nidInvalid;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required.'**
  String get fullNameRequired;

  /// No description provided for @fullNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid full name (e.g., John Doe, O\'Connor, Mary-Jane).'**
  String get fullNameInvalid;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in'**
  String get resendCodeIn;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmPassword;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @enterVerifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get enterVerifyCode;

  /// No description provided for @otpTitleSignup.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpTitleSignup;

  /// No description provided for @profileInfo.
  ///
  /// In en, this message translates to:
  /// **'Profile Info'**
  String get profileInfo;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotThePassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotThePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @doNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get doNotHaveAccount;

  /// No description provided for @accountDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get accountDeleteMessage;

  /// No description provided for @otpSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get otpSendButton;

  /// No description provided for @didntReciveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get didntReciveCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get deleteUser;

  /// No description provided for @blockUser.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get blockUser;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @privacyNotice.
  ///
  /// In en, this message translates to:
  /// **'Privacy Notice'**
  String get privacyNotice;

  /// No description provided for @termsOfuse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfuse;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @codeHasBeenSentTo.
  ///
  /// In en, this message translates to:
  /// **'A Code has been sent to your Email Address'**
  String get codeHasBeenSentTo;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @noDetailsAvailableForThisNotification.
  ///
  /// In en, this message translates to:
  /// **'No details available for this notification'**
  String get noDetailsAvailableForThisNotification;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @buySellKeepFavoriteTickets.
  ///
  /// In en, this message translates to:
  /// **'Buy, Sell, and Keep your Favorite Tickets'**
  String get buySellKeepFavoriteTickets;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'©2025 Essence Software. All rights reserved.'**
  String get copyright;

  /// No description provided for @letsSignYouIn.
  ///
  /// In en, this message translates to:
  /// **'Let’s sign you in'**
  String get letsSignYouIn;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back.'**
  String get welcomeBack;

  /// No description provided for @youHaveBeenMissed.
  ///
  /// In en, this message translates to:
  /// **'You have been missed!'**
  String get youHaveBeenMissed;

  /// No description provided for @pleaseSelectARoleBeforeContinuing.
  ///
  /// In en, this message translates to:
  /// **'Please select a role before continuing'**
  String get pleaseSelectARoleBeforeContinuing;

  /// No description provided for @attendee.
  ///
  /// In en, this message translates to:
  /// **'Attendee'**
  String get attendee;

  /// No description provided for @organizer.
  ///
  /// In en, this message translates to:
  /// **'Organizer'**
  String get organizer;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @confim.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confim;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @selectYourPreference.
  ///
  /// In en, this message translates to:
  /// **'Select Your Preference'**
  String get selectYourPreference;

  /// No description provided for @eventsWillBeShownBasedOnYourPreferences.
  ///
  /// In en, this message translates to:
  /// **'Events will be shown based on your preferences'**
  String get eventsWillBeShownBasedOnYourPreferences;

  /// No description provided for @newlyAddedEvents.
  ///
  /// In en, this message translates to:
  /// **'Newly Added Events'**
  String get newlyAddedEvents;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @morePlus.
  ///
  /// In en, this message translates to:
  /// **'More+'**
  String get morePlus;

  /// No description provided for @popularEvents.
  ///
  /// In en, this message translates to:
  /// **'Popular Events'**
  String get popularEvents;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @searchEventsHere.
  ///
  /// In en, this message translates to:
  /// **'Search events here'**
  String get searchEventsHere;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @privacyConcerns.
  ///
  /// In en, this message translates to:
  /// **'Privacy concerns'**
  String get privacyConcerns;

  /// No description provided for @eroticContent.
  ///
  /// In en, this message translates to:
  /// **'Erotic content'**
  String get eroticContent;

  /// No description provided for @copyrightViolations.
  ///
  /// In en, this message translates to:
  /// **'Copyright violations'**
  String get copyrightViolations;

  /// No description provided for @defamation.
  ///
  /// In en, this message translates to:
  /// **'Defamation'**
  String get defamation;

  /// No description provided for @obscene.
  ///
  /// In en, this message translates to:
  /// **'Obscene'**
  String get obscene;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @selectReasons.
  ///
  /// In en, this message translates to:
  /// **'Select Reasons'**
  String get selectReasons;

  /// No description provided for @otherDetails.
  ///
  /// In en, this message translates to:
  /// **'Other/ Details'**
  String get otherDetails;

  /// No description provided for @typeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message'**
  String get typeYourMessage;

  /// No description provided for @maximumFileSelection.
  ///
  /// In en, this message translates to:
  /// **'Maximum {count} files/Images can be selected'**
  String maximumFileSelection(Object count);

  /// No description provided for @moreMinus.
  ///
  /// In en, this message translates to:
  /// **'More-'**
  String get moreMinus;

  /// No description provided for @getOrganizerTicket.
  ///
  /// In en, this message translates to:
  /// **'Get Organizer Ticket'**
  String get getOrganizerTicket;

  /// No description provided for @viewAttendeeTickets.
  ///
  /// In en, this message translates to:
  /// **'View Attendee Tickets'**
  String get viewAttendeeTickets;

  /// No description provided for @messageOrganizer.
  ///
  /// In en, this message translates to:
  /// **'Message Organizer'**
  String get messageOrganizer;

  /// No description provided for @attendeeInformation.
  ///
  /// In en, this message translates to:
  /// **'Attendee Information'**
  String get attendeeInformation;

  /// No description provided for @tickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get tickets;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @summery.
  ///
  /// In en, this message translates to:
  /// **'Summery'**
  String get summery;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @mainlandFee.
  ///
  /// In en, this message translates to:
  /// **'Mainland Fee'**
  String get mainlandFee;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
