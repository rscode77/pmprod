part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginInitialEvent extends LoginEvent {
  const LoginInitialEvent();
}

class LoginUserEvent extends LoginEvent {
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

class LogoutUserEvent extends LoginEvent {
  const LogoutUserEvent();
}