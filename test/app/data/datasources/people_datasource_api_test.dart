import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_dojo/app/data/template/datasources/people_datasource_api.dart';
import 'package:flutter_dojo/app/data/template/models/people_model.dart';
import 'package:flutter_dojo/common/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/response_mock..dart';

class DioMock extends Mock implements DioForNative {}

void main() {
  final dioMock = DioMock();
  PeopleDataSourceApi datasource;

  setUp(() {
    datasource = PeopleDataSourceApi(dioMock);
  });

  final peopleList = (json.decode(responseAll)['results']).map((e) => PeopleModel.fromMap(e)).toList();

  test('should return a PeopleModel from API', () async {
    //arrange
    when(dioMock.get(any)).thenAnswer((_) async => Response(data: json.decode(responseAll), statusCode: 200));
    //act
    final result = await datasource.getAll();
    //assert
    verify(dioMock.get(any)).called(1);
    expect(result, equals(peopleList));
  });

  test('should return a DioFalure from API', () async {
    //arrange
    when(dioMock.get(any)).thenThrow(DioFailure(message: 'message', statusCode: 401));

    //act
    final result = datasource.getAll();

    //assert
    verify(dioMock.get(any)).called(1);

    expect(result, throwsA(isA<DioFailure>()));
  });
}
