import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/data/template/datasources/people_datasource.dart';
import 'package:flutter_dojo/app/data/template/models/people_model.dart';
import 'package:flutter_dojo/app/data/template/repositories/people_repository_impl.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/app/errors/template/template_errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTemplateDatasource extends Mock implements PeopleDataSource {}

void main() {
  MockTemplateDatasource _datasource;
  PeopleRepositoryImpl _repository;

  final tTemplatemodel = PeopleModel(
      height: '150', mass: '40', name: 'Teste Flutter', url: 'www.url/id/10');

  PeopleEntity tTemplateEntity = tTemplatemodel;

  setUp(() {
    _datasource = MockTemplateDatasource();
    _repository = PeopleRepositoryImpl(_datasource);
  });

  // group('test repository get one', () {
  //   test('''
  //     Given a Url
  //     When successful
  //     Then return Right(result)
  //   ''', () async {
  //     var tTemplate = TemplateModel(
  //       url: "url",
  //       name: "teste",
  //       mass: "70.0",
  //       height: "175",
  //     );

  //     var tId = 'https://www.teste.com/1';
  //     //prepare
  //     when(_datasource.getOne(any)).thenAnswer((_) async => tTemplate);

  //     //execute
  //     final result = await _repository.getOne(tId);

  //     //assert
  //     expect(result, isA<Right>());
  //     verify(_datasource.getOne(tId)).called(1);
  //   });
  // });

  group('test repository get all', () {
    test('''
      Call repository getAll
      When DioError
      Then return Left(GetAllTemplateError);
)
    ''', () async {
      //prepare
      // Response response = Response();
      when(_datasource.getAll()).thenAnswer((_) async => null);
      // execute
      final result = await _repository.getAll();
      // assert
      expect(result.fold(id, id), isA<GetAllTemplateError>());
      verify(_repository.getAll()).called(1);
    });
    test('''
      Call repository getAll
      When TemplateEntity
      Then return Right(TemplateEntity)
    ''', () async {
      //prepare
      when(_datasource.getAll()).thenAnswer((_) async => [tTemplatemodel]);
      // execute
      final result = await _repository.getAll();
      // assert
      expect(result | null, isA<List<PeopleEntity>>());
      verify(_datasource.getAll()).called(1);
      verifyNoMoreInteractions(_datasource);
    });
   
  });
}
