import 'package:dio/dio.dart';
import 'package:pmprod/networking/models/login_model.dart';
import 'package:pmprod/networking/requests/login_request.dart';
import 'package:pmprod/repositories/user_repository.dart';

class NetworkUserRepository implements UserRepository {
  const NetworkUserRepository();

  @override
  Future<LoginModel> loginUser(LoginRequest request) async {
    return const LoginModel(id: '1', userName: 'Rafał Szyller');

    // final Response response = await dio.post(
    //   'Endpoints.user.login',
    //   data: request.toJson(),
    // );
    // return LoginModel.fromJson(response.data as Map<String, dynamic>);
  }
}