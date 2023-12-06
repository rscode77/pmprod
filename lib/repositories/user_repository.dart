import 'package:dio/dio.dart';
import 'package:pmprod/networking/requests/authentication_request.dart';

abstract class AuthenticationRepository {
  Future<Response> loginUser(AuthenticationRequest request);
}