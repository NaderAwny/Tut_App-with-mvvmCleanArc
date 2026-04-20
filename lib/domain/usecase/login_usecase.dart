import 'package:dartz/dartz.dart';
import 'package:mvvmclean/data/network/failure.dart';
import 'package:mvvmclean/data/network/requests.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/domain/repository/repository.dart';
import 'package:mvvmclean/domain/usecase/base_usecase.dart';

class LoginUsecase implements BaseUsecase<LoginUsecaseInput, Authentication> {
  final Repository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUsecaseInput input,
  ) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUsecaseInput {
  String email;
  String password;

  LoginUsecaseInput(this.email, this.password);
}
