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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get usernameField {
    return Intl.message(
      'Username',
      name: 'usernameField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordField {
    return Intl.message(
      'Password',
      name: 'passwordField',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMeCheckbox {
    return Intl.message(
      'Remember me',
      name: 'rememberMeCheckbox',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `By signing-in you agreed to our `
  String get licenseBySigningIn {
    return Intl.message(
      'By signing-in you agreed to our ',
      name: 'licenseBySigningIn',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get licenseTermsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'licenseTermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get licenseAnd {
    return Intl.message(
      ' and ',
      name: 'licenseAnd',
      desc: '',
      args: [],
    );
  }

  /// `EULA`
  String get licenseEULA {
    return Intl.message(
      'EULA',
      name: 'licenseEULA',
      desc: '',
      args: [],
    );
  }

  /// `. You should only use app when it is safe and legal to do so.`
  String get licenseEnding {
    return Intl.message(
      '. You should only use app when it is safe and legal to do so.',
      name: 'licenseEnding',
      desc: '',
      args: [],
    );
  }

  /// `Created by Transport Exchange Group Ltd 2000-2021`
  String get trademark {
    return Intl.message(
      'Created by Transport Exchange Group Ltd 2000-2021',
      name: 'trademark',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'GB'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'CA'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}