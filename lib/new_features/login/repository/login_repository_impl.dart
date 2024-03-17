import 'dart:io';

import 'package:hope/core/resources/data_state.dart';
import 'package:hope/new_features/login/data_sources/remote/login_api_service.dart';
import 'package:hope/new_features/login/interfaces/login_repository.dart';
import 'package:hope/new_features/login/models/user.dart';

class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<DataState<String>> login(User user) async {
    final httpResponse = await LoginApiService.loginRequest(user.username, user.password);

    if (httpResponse.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.body);
    } else {
      return DataFailed();
    }
  }

}