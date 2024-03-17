import 'package:hope/core/resources/data_state.dart';
import 'package:hope/new_features/login/models/user.dart';

abstract class LoginRepository{
  Future<DataState<String>> login(User user);
}
