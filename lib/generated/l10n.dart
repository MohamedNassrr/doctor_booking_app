// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hope you're doing fine.`
  String get hopeYouAreDoingFine {
    return Intl.message(
      'Hope you\'re doing fine.',
      name: 'hopeYouAreDoingFine',
      desc: '',
      args: [],
    );
  }

  /// `Hi, Welcome Back!`
  String get hiWelcomeBack {
    return Intl.message(
      'Hi, Welcome Back!',
      name: 'hiWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message('Your Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Email can't be empty`
  String get emailCantBeEmpty {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emailCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Password can't be empty`
  String get passwordCantBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `No user found for that email.`
  String get error_user_not_found {
    return Intl.message(
      'No user found for that email.',
      name: 'error_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided.`
  String get error_wrong_password {
    return Intl.message(
      'Wrong password provided.',
      name: 'error_wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists with different credentials.`
  String get error_account_exists {
    return Intl.message(
      'Account already exists with different credentials.',
      name: 'error_account_exists',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get error_generic {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'error_generic',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your internet connection.`
  String get error_network_failed {
    return Intl.message(
      'Network error. Please check your internet connection.',
      name: 'error_network_failed',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get yourName {
    return Intl.message('Your name', name: 'yourName', desc: '', args: []);
  }

  /// `Please enter your name`
  String get usernameValidation {
    return Intl.message(
      'Please enter your name',
      name: 'usernameValidation',
      desc: '',
      args: [],
    );
  }

  /// `We are here to help you!`
  String get weAreHereToHelpYou {
    return Intl.message(
      'We are here to help you!',
      name: 'weAreHereToHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account?`
  String get doYouHaveAnAccount {
    return Intl.message(
      'Do you have an account?',
      name: 'doYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill Your Profile`
  String get fillYourProfile {
    return Intl.message(
      'Fill Your Profile',
      name: 'fillYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Your account is ready to use. You will be redirected to the Home Page in a few seconds...`
  String get accountReady {
    return Intl.message(
      'Your account is ready to use. You will be redirected to the Home Page in a few seconds...',
      name: 'accountReady',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email, we will send you a verification code.`
  String get enterEmailVerification {
    return Intl.message(
      'Enter your Email, we will send you a verification code.',
      name: 'enterEmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `A reset code has been sent to your email.`
  String get resetCodeSent {
    return Intl.message(
      'A reset code has been sent to your email.',
      name: 'resetCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your birth date.`
  String get chooseBirthDate {
    return Intl.message(
      'Please choose your birth date.',
      name: 'chooseBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Search for a doctor...`
  String get searchDoctor {
    return Intl.message(
      'Search for a doctor...',
      name: 'searchDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Medical Centers`
  String get medicalCenters {
    return Intl.message(
      'Medical Centers',
      name: 'medicalCenters',
      desc: '',
      args: [],
    );
  }

  /// `All Doctors`
  String get allDoctors {
    return Intl.message('All Doctors', name: 'allDoctors', desc: '', args: []);
  }

  /// `founds`
  String get founds {
    return Intl.message('founds', name: 'founds', desc: '', args: []);
  }

  /// `Default`
  String get defaultSorting {
    return Intl.message('Default', name: 'defaultSorting', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
