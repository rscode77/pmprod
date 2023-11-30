import 'package:pmprod/networking/models/login_model.dart';
import 'package:pmprod/networking/requests/login_request.dart';

abstract class UserRepository {
  Future<LoginModel> loginUser(LoginRequest request);
}