import 'package:get_it/get_it.dart';
import 'package:pmprod/repositories/network_user_repository.dart';
import 'package:pmprod/repositories/user_repository.dart';
import 'package:pmprod/storages/common_storage.dart';

class Injector {
  static final Injector _instance = Injector._();

  GetIt get getIt => GetIt.instance;

  factory Injector() {
    _instance._init();
    return _instance;
  }

  Injector._();

  void _init() {
    getIt.registerLazySingleton<CommonStorage>(() => const CommonStorage());
    getIt.registerLazySingleton<UserRepository>(() => const NetworkUserRepository());
  }
}
