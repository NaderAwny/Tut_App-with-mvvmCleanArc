import 'package:dartz/dartz.dart';
import 'package:mvvmclean/data/network/failure.dart';
import 'package:mvvmclean/data/network/requests.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/domain/repository/repository.dart';
import 'package:mvvmclean/domain/usecase/base_usecase.dart';

class ForgetPasswordUsecase
    implements BaseUsecase<ForgotPasswordUsecaseInput, ForgotPassword> {
  final Repository _repository;

  ForgetPasswordUsecase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(
    ForgotPasswordUsecaseInput input,
  ) async {
    return await _repository.forgotPassword(ForgotPasswordRequest(input.email));
  }
}

class ForgotPasswordUsecaseInput {
  String email;

  ForgotPasswordUsecaseInput(this.email);
}
