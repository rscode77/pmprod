import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pmprod/errors/status_codes.dart';
import 'package:pmprod/extensions/int_extension.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/generated/l10n.dart';
import 'package:pmprod/networking/models/authentication_model.dart';
import 'package:pmprod/networking/requests/authentication_request.dart';
import 'package:pmprod/repositories/user_repository.dart';
import 'package:pmprod/storages/common_storage.dart';
import 'package:pmprod/storages/common_storage_keys.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CommonStorage commonStorage;
  final AuthenticationRepository userRepository;

  Future<bool> get _isUserLoggedIn async => await commonStorage.getString(CommonStorageKeys.userId) != null;

  ValueNotifier<String> loggedInUsername = ValueNotifier<String>('');

  AuthenticationBloc({
    required this.commonStorage,
    required this.userRepository,
  }) : super(LoginInitial()) {
    on<LoginInitialEvent>(_onLoginInitialEvent);
    on<LoginUserEvent>(_onLoginUserEvent);
    on<LogoutUserEvent>(_onLogoutUserEvent);
  }

  Future<void> _onLoginInitialEvent(AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    commonStorage.removeKey(CommonStorageKeys.userId);
    emit(LoginLoading());
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    if (await _isUserLoggedIn) {
      return emit(
        LoginSuccess(
          user: AuthenticationModel(
            id: await commonStorage.getInt(CommonStorageKeys.userId),
            userName: await commonStorage.getString(CommonStorageKeys.username),
          ),
        ),
      );
    } else {
      emit(LoginInitial());
    }
  }

  Future<void> _onLoginUserEvent(LoginUserEvent event, Emitter<AuthenticationState> emit) async {
    Response response = await userRepository.loginUser(
      AuthenticationRequest(userId: event.userId),
    );

    if(response.statusCode != StatusCodes.success) return;

    AuthenticationModel user = AuthenticationModel.fromJson(response.data as Map<String, dynamic>);
    if (user.id == null || user.userName == null) return emit(LoginFailed(message: S.current.loginFailed));

    commonStorage.putInt(
      CommonStorageKeys.userId,
      user.id.orZero(),
    );
    commonStorage.putString(
      CommonStorageKeys.username,
      user.userName.orEmpty(),
    );

    loggedInUsername.value = user.userName.orEmpty();

    emit(LoginSuccess(user: user));
  }

  Future<void> _onLogoutUserEvent(LogoutUserEvent event, Emitter<AuthenticationState> emit) async {
    commonStorage.removeKey(CommonStorageKeys.userId);
    commonStorage.removeKey(CommonStorageKeys.username);
    emit(LoginInitial());
  }
}
