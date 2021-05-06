import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/common/errors/failure.dart';

abstract class PeopleRepository {
  Future<Either<Failure, List<PeopleEntity>>> getAll();

  Future<Either<Failure, PeopleEntity>> getOne(String url);
}
