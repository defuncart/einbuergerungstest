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
// ignore_for_file: always_use_package_imports

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Dashboard`
  String get homeScreenDashboardLabel {
    return Intl.message(
      'Dashboard',
      name: 'homeScreenDashboardLabel',
      desc: 'Label for dashboard item',
      args: [],
    );
  }

  /// `Merkliste`
  String get homeScreenFavoritesLabel {
    return Intl.message(
      'Merkliste',
      name: 'homeScreenFavoritesLabel',
      desc: 'Label for favorites item',
      args: [],
    );
  }

  /// `Vorschritt`
  String get homeScreenProgressLabel {
    return Intl.message(
      'Vorschritt',
      name: 'homeScreenProgressLabel',
      desc: 'Label for progress item',
      args: [],
    );
  }

  /// `Test`
  String get homeScreenTestButtonText {
    return Intl.message(
      'Test',
      name: 'homeScreenTestButtonText',
      desc: 'Button text for test FAB',
      args: [],
    );
  }

  /// `Tipps`
  String get homeScreenTipsLabel {
    return Intl.message(
      'Tipps',
      name: 'homeScreenTipsLabel',
      desc: 'Label for tips item',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
