import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pmprod/bloc/authentication_bloc.dart';
import 'package:pmprod/pages/app_page.dart';
import 'package:pmprod/repositories/user_repository.dart';
import 'package:pmprod/routing/routing.dart';
import 'package:pmprod/storages/common_storage.dart';

class PmProdApp extends StatefulWidget {
  const PmProdApp({super.key});

  @override
  State<PmProdApp> createState() => _PmProdAppState();
}

class _PmProdAppState extends State<PmProdApp> {
  late final AuthenticationBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = AuthenticationBloc(
      commonStorage: GetIt.instance.get<CommonStorage>(),
      userRepository: GetIt.instance.get<AuthenticationRepository>(),
    )..add(const LoginInitialEvent());
    super.initState();
  }

  @override
  dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginBloc,
      child: AppPage(
        initialRoute: _initialRoute(),
      ),
    );
  }

  String _initialRoute() {
    return Routing.login;
  }
}
