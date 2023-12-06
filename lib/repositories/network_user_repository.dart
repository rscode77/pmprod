import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pmprod/networking/endpoints.dart';
import 'package:pmprod/networking/models/authentication_model.dart';
import 'package:pmprod/networking/requests/authentication_request.dart';
import 'package:pmprod/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class NetworkUserRepository implements AuthenticationRepository {
  final Dio dio;

  const NetworkUserRepository({
    required this.dio,
  });

  @override
  Future<Response<AuthenticationModel>> loginUser(AuthenticationRequest request) async {
    //return const AuthenticationModel(id: '1', userName: 'Rafał Szyller');
    print(dio.options.baseUrl);
    print(AuthenticationEndpoints.login);
    var header = {'Content-type': 'application/json; charset=utf-8'};
    final response = await dio.get(
      AuthenticationEndpoints.login,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: header
      ),
      data: {
        'userId': '5555',
      },
    );
    
    print(response.data);

    return response.data;
  }
}
