import 'package:dartz/dartz.dart';
import 'package:mvvmclean/data/network/failure.dart';
import 'package:mvvmclean/data/network/requests.dart';
import 'package:mvvmclean/domain/model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, ForgotPassword>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  );
  //Future<Either<Failure, String>> forgetPassword(
  // String email,);
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  );
  Future<Either<Failure, HomeObject>> getHome();
  Future<Either<Failure, HomeDetailsObject>> getHomeDetails(int id);
}
