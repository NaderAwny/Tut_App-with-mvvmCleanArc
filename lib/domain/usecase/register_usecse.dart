import 'package:dartz/dartz.dart';
import 'package:mvvmclean/data/network/failure.dart';
import 'package:mvvmclean/data/network/requests.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/domain/repository/repository.dart';
import 'package:mvvmclean/domain/usecase/base_usecase.dart';

class RegisterUsecase implements BaseUsecase<RegisterUsecaseInput, Authentication> {
  final Repository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    RegisterUsecaseInput input,
  ) async {
    return await _repository.register(RegisterRequest(input.email, input.password, input.userName, input.countryMobileCode, input.mobileNumber, input.profilePicture));
  }
}

class RegisterUsecaseInput {
  String email;
  String password;
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String profilePicture;

  RegisterUsecaseInput(this.email, this.password, this.userName, this.countryMobileCode, this.mobileNumber, this.profilePicture);
}

