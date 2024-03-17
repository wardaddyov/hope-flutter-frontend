import 'package:flutter/cupertino.dart';
import 'package:hope/core/resources/data_state.dart';

import 'package:hope/new_features/login/interfaces/login_repository.dart';
import 'package:hope/new_features/login/models/user.dart';
import 'package:hope/new_features/login/repository/login_repository_impl.dart';

class JwtProvider extends ChangeNotifier{
  String? jwtToken;
  bool? failure;

  void getJwtToken(User user) async {
    LoginRepositoryImpl loginRepository = LoginRepositoryImpl();

    final dataState = await loginRepository.login(user);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty){
      jwtToken = dataState.data;
      failure = false;
    }

    if (dataState is DataFailed){
      jwtToken = null;
      failure = true;
    }
  }
}