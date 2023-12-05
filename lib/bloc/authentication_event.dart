part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class LoginInitialEvent extends AuthenticationEvent {
  const LoginInitialEvent();
}

class LoginUserEvent extends AuthenticationEvent {
  final String userId;

  const LoginUserEvent({
    required this.userId,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        userId,
      ];
}

class LogoutUserEvent extends AuthenticationEvent {
  const LogoutUserEvent();
}