import 'package:pmprod/networking/models/authentication_model.dart';
import 'package:pmprod/repositories/user_repository.dart';

extension AuthenticationModelMapper on AuthenticationRepository {
  AuthenticationModel mapToAuthenticationModel() {
    return AuthenticationModel(
      id: 1,
      userName: 'userName',
    );
  }
}