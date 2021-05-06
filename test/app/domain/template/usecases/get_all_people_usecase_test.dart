import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:flutter_dojo/app/domain/template/repositories/people_repository.dart';
import 'package:flutter_dojo/app/domain/template/usecases/get_all_people_usecase_impl.dart';
import 'package:flutter_dojo/app/domain/template/usecases/interfaces/get_all_people_usecase.dart';
import 'package:flutter_dojo/app/errors/template/template_errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/response_mock..dart';

class MockTemplateRepository extends Mock implements PeopleRepository {}

void main() {
  MockTemplateRepository _repository;
  GetAllPeopleUseCase _usecase;

  final List<PeopleEntity> tTemplate = [
    PeopleEntity(url: "url", name: "teste", mass: "70.0", height: "175")
  ];

  setUp(() {
    _repository = MockTemplateRepository();
    _usecase = GetAllPeopleUseCaseImpl(_repository);
  });

  group('test Usecase template', () {
    test('should get template from the repository', () async {
      var test = jsonDecode(response_ok)['name'];
      // arrange
      when(_repository.getAll()).thenAnswer((_) async => Right(tTemplate));
      //actual
      final result = await _usecase();
      //assert
      expect(result, Right(tTemplate));
      verify(_repository.getAll()).called(1);
      verifyNoMoreInteractions(_repository);
    });

    test('should be get Exception from the repository', () async {
      // arrange
      when(_repository.getAll())
          .thenAnswer((_) async => Left(GetAllTemplateError()));
      // actual
      final result = await _usecase();
      // assert
      expect(result, Left(GetAllTemplateError()));
      verify(_repository.getAll()).called(1);
      verifyNoMoreInteractions(_repository);
    });
  });
}
