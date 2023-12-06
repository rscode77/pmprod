import 'package:dio/dio.dart';
import 'package:pmprod/networking/endpoints.dart';
import 'package:pmprod/networking/requests/authentication_request.dart';
import 'package:pmprod/repositories/user_repository.dart';

class NetworkUserRepository implements AuthenticationRepository {
  final Dio dio;

  const NetworkUserRepository({
    required this.dio,
  });

  @override
  Future<Response> loginUser(AuthenticationRequest request) async {
    final Response response = await dio.post(
      AuthenticationEndpoints.login,
      data: request.toJson(),
    );
    return response;
  }
}
