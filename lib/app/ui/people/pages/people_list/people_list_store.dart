import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/template/entities/people_entity.dart';

part 'people_list_store.g.dart';

class PeopleListStore = _PeopleListStoreBase with _$PeopleListStore;

abstract class _PeopleListStoreBase with Store {
  @observable
  ObservableList<PeopleEntity> people = <PeopleEntity>[].asObservable();

  @action
  void setListPeople(List<PeopleEntity> value) => people = value.asObservable();

  @action
  void add(PeopleEntity obj) => people.add(obj);
}
