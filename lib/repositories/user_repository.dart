import 'package:dio/dio.dart';
import 'package:pmprod/networking/models/authentication_model.dart';
import 'package:pmprod/networking/requests/authentication_request.dart';

abstract class AuthenticationRepository {
  Future<Response<AuthenticationModel>> loginUser(AuthenticationRequest request);
}