import 'package:flutter_dojo/app/data/template/models/people_model.dart';

abstract class PeopleDataSource {
  Future<List<PeopleModel>> getAll();

  Future<PeopleModel> getOne(String id);
}
