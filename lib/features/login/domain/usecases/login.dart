import 'package:hope/core/resources/data_state.dart';
import 'package:hope/core/usecases/usecase.dart';
import 'package:hope/features/login/domain/repository/login_repository.dart';


class LoginUseCase implements UseCase<DataState<String>, void>{
  final LoginRepository _loginRepository;
  final String username;
  final String password;

  LoginUseCase(this._loginRepository, this.username, this.password);


  @override
  Future<DataState<String>> call({void params}) {
    return _loginRepository.login(username, password);
  }
  
}