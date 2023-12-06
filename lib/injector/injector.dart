import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pmprod/networking/endpoints.dart';
import 'package:pmprod/repositories/network_user_repository.dart';
import 'package:pmprod/repositories/user_repository.dart';
import 'package:pmprod/storages/common_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injector {
  static final Injector _instance = Injector._();
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    ),
  );

  static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  GetIt get getIt => GetIt.instance;

  factory Injector() {
    _instance._init();
    return _instance;
  }

  Injector._();

  void _init() {
    getIt.registerLazySingleton<CommonStorage>(() => CommonStorage(sharedPreferences: _sharedPreferences));
    getIt.registerLazySingleton<AuthenticationRepository>(() => NetworkUserRepository(dio: _dio));
  }
}
