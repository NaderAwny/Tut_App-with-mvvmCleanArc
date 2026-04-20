// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:mvvmclean/data/network/failure.dart';
import 'package:mvvmclean/domain/model/models.dart';
import 'package:mvvmclean/domain/repository/repository.dart';
import 'package:mvvmclean/domain/usecase/base_usecase.dart';

class HomeDetailsUseCase implements BaseUsecase<int, HomeDetailsObject> {
  final Repository _repository;
  HomeDetailsUseCase(this._repository);
  @override
  Future<Either<Failure, HomeDetailsObject>> execute(int input) async {
    return await _repository.getHomeDetails(input);
  }
}
