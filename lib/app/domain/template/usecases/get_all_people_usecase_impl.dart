import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/app/domain/template/repositories/people_repository.dart';
import 'package:flutter_dojo/app/domain/template/usecases/interfaces/get_all_people_usecase.dart';
import 'package:flutter_dojo/common/errors/failure.dart';

class GetAllPeopleUseCaseImpl
    implements GetAllPeopleUseCase{
  final PeopleRepository _repository;
  GetAllPeopleUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<PeopleEntity>>> call() async {
    return await _repository.getAll();
  }
}
