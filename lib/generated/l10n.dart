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

  /// `PressMetal Produkcja`
  String get appName {
    return Intl.message(
      'PressMetal Produkcja',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Wprowadź id użytkownika`
  String get userId {
    return Intl.message(
      'Wprowadź id użytkownika',
      name: 'userId',
      desc: '',
      args: [],
    );
  }

  /// `Nieprawidłowe dane logowania`
  String get loginFailed {
    return Intl.message(
      'Nieprawidłowe dane logowania',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Zrealizowane`
  String get realized {
    return Intl.message(
      'Zrealizowane',
      name: 'realized',
      desc: '',
      args: [],
    );
  }

  /// `Szukaj`
  String get search {
    return Intl.message(
      'Szukaj',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Plan pracy`
  String get workPlan {
    return Intl.message(
      'Plan pracy',
      name: 'workPlan',
      desc: '',
      args: [],
    );
  }

  /// `Zapisz`
  String get save {
    return Intl.message(
      'Zapisz',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Anuluj`
  String get cancel {
    return Intl.message(
      'Anuluj',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Wyloguj`
  String get logout {
    return Intl.message(
      'Wyloguj',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Zaloguj`
  String get login {
    return Intl.message(
      'Zaloguj',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Aktualna ilość`
  String get actualQuantity {
    return Intl.message(
      'Aktualna ilość',
      name: 'actualQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Wprowadź aktualnie zrealizowaną ilość detali`
  String get actualRealizedQuantity {
    return Intl.message(
      'Wprowadź aktualnie zrealizowaną ilość detali',
      name: 'actualRealizedQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Ilosć w zleceniu:`
  String get orderQuantity {
    return Intl.message(
      'Ilosć w zleceniu:',
      name: 'orderQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Materiał:`
  String get material {
    return Intl.message(
      'Materiał:',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `Opis detalu:`
  String get partDescription {
    return Intl.message(
      'Opis detalu:',
      name: 'partDescription',
      desc: '',
      args: [],
    );
  }

  /// `Zgłoś brakujące detale`
  String get reportMissingParts {
    return Intl.message(
      'Zgłoś brakujące detale',
      name: 'reportMissingParts',
      desc: '',
      args: [],
    );
  }

  /// `Potwierdź operację`
  String get confirmOperation {
    return Intl.message(
      'Potwierdź operację',
      name: 'confirmOperation',
      desc: '',
      args: [],
    );
  }

  /// `Tak`
  String get yes {
    return Intl.message(
      'Tak',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Nie`
  String get no {
    return Intl.message(
      'Nie',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Czy chcesz zaktualizować ilość zrealizowanych detali?`
  String get confirmQuantity {
    return Intl.message(
      'Czy chcesz zaktualizować ilość zrealizowanych detali?',
      name: 'confirmQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Wprowadź ilość brakująch detali`
  String get enterNumberOfMissingParts {
    return Intl.message(
      'Wprowadź ilość brakująch detali',
      name: 'enterNumberOfMissingParts',
      desc: '',
      args: [],
    );
  }

  /// `Wczytaj plan`
  String get loadPlan {
    return Intl.message(
      'Wczytaj plan',
      name: 'loadPlan',
      desc: '',
      args: [],
    );
  }

  /// `Ustawienia`
  String get settings {
    return Intl.message(
      'Ustawienia',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Wybierz z jakiego dnia chcesz wczytać plan`
  String get selectDatePlan {
    return Intl.message(
      'Wybierz z jakiego dnia chcesz wczytać plan',
      name: 'selectDatePlan',
      desc: '',
      args: [],
    );
  }

  /// `Kliknij aby się wylogować`
  String get logoutUser {
    return Intl.message(
      'Kliknij aby się wylogować',
      name: 'logoutUser',
      desc: '',
      args: [],
    );
  }

  /// `Wczytaj zlecenie`
  String get loadOrder {
    return Intl.message(
      'Wczytaj zlecenie',
      name: 'loadOrder',
      desc: '',
      args: [],
    );
  }

  /// `Wybierz aby wczytać pozycje w zleceniu`
  String get selectOrder {
    return Intl.message(
      'Wybierz aby wczytać pozycje w zleceniu',
      name: 'selectOrder',
      desc: '',
      args: [],
    );
  }

  /// `Wczytaj`
  String get loadData {
    return Intl.message(
      'Wczytaj',
      name: 'loadData',
      desc: '',
      args: [],
    );
  }

  /// `Wprowadź numer zlecenia`
  String get selectOrderToLoad {
    return Intl.message(
      'Wprowadź numer zlecenia',
      name: 'selectOrderToLoad',
      desc: '',
      args: [],
    );
  }

  /// `Numer zlecenia`
  String get orderNumber {
    return Intl.message(
      'Numer zlecenia',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Zlecenie`
  String get order {
    return Intl.message(
      'Zlecenie',
      name: 'order',
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
