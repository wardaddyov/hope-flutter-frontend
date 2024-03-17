import 'package:hope/core/resources/data_state.dart';

abstract class LoginRepository{
  Future<DataState<String>> login(String username, String password);
}
