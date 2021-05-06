import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/app/domain/template/repositories/people_repository.dart';
import 'package:flutter_dojo/common/errors/failure.dart';
import 'package:flutter_dojo/common/usecase/usecase.dart';

class GetOneTemplateUseCase
    implements UseCase<Either<Failure, PeopleEntity>, String> {
  final PeopleRepository _repository;

  GetOneTemplateUseCase(this._repository);

  @override
  Future<Either<Failure, PeopleEntity>> call(String url) =>
      _repository.getOne(url);
}

class Params extends Equatable {
  final int id;

  Params({@required this.id});

  List<Object> get props => [id];
}
