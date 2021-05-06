import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/common/errors/failure.dart';

abstract class GetAllPeopleUseCase{
   Future<Either<Failure, List<PeopleEntity>>> call();
}