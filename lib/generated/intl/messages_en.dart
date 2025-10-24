// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "doYouHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Do you have an account?",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account yet?",
    ),
    "emailCantBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Email can\'t be empty",
    ),
    "error_account_exists": MessageLookupByLibrary.simpleMessage(
      "Account already exists with different credentials.",
    ),
    "error_generic": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "error_network_failed": MessageLookupByLibrary.simpleMessage(
      "Network error. Please check your internet connection.",
    ),
    "error_user_not_found": MessageLookupByLibrary.simpleMessage(
      "No user found for that email.",
    ),
    "error_wrong_password": MessageLookupByLibrary.simpleMessage(
      "Wrong password provided.",
    ),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget Password?"),
    "hiWelcomeBack": MessageLookupByLibrary.simpleMessage("Hi, Welcome Back!"),
    "hopeYouAreDoingFine": MessageLookupByLibrary.simpleMessage(
      "Hope you\'re doing fine.",
    ),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordCantBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Password can\'t be empty",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "pleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signInWithFacebook": MessageLookupByLibrary.simpleMessage(
      "Sign In with Facebook",
    ),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign In with Google",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "usernameValidation": MessageLookupByLibrary.simpleMessage(
      "Please enter your name",
    ),
    "weAreHereToHelpYou": MessageLookupByLibrary.simpleMessage(
      "We are here to help you!",
    ),
    "yourEmail": MessageLookupByLibrary.simpleMessage("Your Email"),
    "yourName": MessageLookupByLibrary.simpleMessage("Your name"),
  };
}
