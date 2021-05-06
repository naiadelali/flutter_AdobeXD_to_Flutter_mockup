import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/data/template/datasources/people_datasource.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/app/domain/template/repositories/people_repository.dart';
import 'package:flutter_dojo/app/errors/template/template_errors.dart';
import 'package:flutter_dojo/common/errors/failure.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleDataSource _dataSource;

  PeopleRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<PeopleEntity>>> getAll() async {
    try {
      final result = await _dataSource.getAll();
      if (result == null) {
        return Left(GetAllTemplateError(message: 'Data is null of datasource'));
      }
      return Right(result);
    } on Failure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(GetAllTemplateError(message: 'Datasource error not found'));
    }
  }

  @override
  Future<Either<Failure, PeopleEntity>> getOne(String url) async =>
      Right(await _dataSource.getOne(url));
}
