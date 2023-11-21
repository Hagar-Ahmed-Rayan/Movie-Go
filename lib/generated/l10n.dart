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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Y O  U R    M O V I E S  `
  String get title {
    return Intl.message(
      'Y O  U R    M O V I E S  ',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Now Playing`
  String get homeTab1 {
    return Intl.message(
      'Now Playing',
      name: 'homeTab1',
      desc: '',
      args: [],
    );
  }

  /// `UpComing`
  String get homeTab2 {
    return Intl.message(
      'UpComing',
      name: 'homeTab2',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get homeTab3 {
    return Intl.message(
      'Top Rated',
      name: 'homeTab3',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get homeTab4 {
    return Intl.message(
      'Popular',
      name: 'homeTab4',
      desc: '',
      args: [],
    );
  }

  /// `About Movie`
  String get detailsTab1 {
    return Intl.message(
      'About Movie',
      name: 'detailsTab1',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get detailsTab2 {
    return Intl.message(
      'Reviews',
      name: 'detailsTab2',
      desc: '',
      args: [],
    );
  }

  /// `Cast`
  String get detailsTab3 {
    return Intl.message(
      'Cast',
      name: 'detailsTab3',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get detailsAppBar {
    return Intl.message(
      'Details',
      name: 'detailsAppBar',
      desc: '',
      args: [],
    );
  }

  /// `There are No Reviews Yet`
  String get noReviews {
    return Intl.message(
      'There are No Reviews Yet',
      name: 'noReviews',
      desc: '',
      args: [],
    );
  }

  /// `Character Name`
  String get charName {
    return Intl.message(
      'Character Name',
      name: 'charName',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Watch Now`
  String get watchNow {
    return Intl.message(
      'Watch Now',
      name: 'watchNow',
      desc: '',
      args: [],
    );
  }

  /// `Search for  your movie`
  String get hintSearch {
    return Intl.message(
      'Search for  your movie',
      name: 'hintSearch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your movie `
  String get validateSearch {
    return Intl.message(
      'Please enter your movie ',
      name: 'validateSearch',
      desc: '',
      args: [],
    );
  }

  /// `No items Found`
  String get noSearchResult {
    return Intl.message(
      'No items Found',
      name: 'noSearchResult',
      desc: '',
      args: [],
    );
  }

  /// `No Rate`
  String get noRate {
    return Intl.message(
      'No Rate',
      name: 'noRate',
      desc: '',
      args: [],
    );
  }

  /// ` no image`
  String get noImage {
    return Intl.message(
      ' no image',
      name: 'noImage',
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
