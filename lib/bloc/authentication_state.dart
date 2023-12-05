part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class LoginInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends AuthenticationState {
  final LoginModel user;

  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailed extends AuthenticationState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}
