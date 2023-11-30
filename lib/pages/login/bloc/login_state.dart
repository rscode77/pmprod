part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginModel user;

  const LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}
