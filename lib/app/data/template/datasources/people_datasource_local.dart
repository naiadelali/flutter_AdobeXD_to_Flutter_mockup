import 'package:flutter_dojo/app/data/template/datasources/people_datasource.dart';
import 'package:flutter_dojo/app/data/template/models/people_model.dart';

class PeopleDataSourceLocal implements PeopleDataSource {
  @override
  Future<List<PeopleModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PeopleModel> getOne(String id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
