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
