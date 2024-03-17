import 'package:dio/dio.dart';
import 'package:hope/core/resources/data_state.dart';
import 'package:hope/features/login/data/data_sources/remote/login_api_service.dart';
import 'package:hope/features/login/domain/repository/login_repository.dart';
import 'dart:io';

class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<DataState<String>> login(String username, String password) async {
    final httpResponse = await LoginApiService.loginRequest(username, password);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

}