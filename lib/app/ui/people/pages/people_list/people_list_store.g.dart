// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PeopleListStore on _PeopleListStoreBase, Store {
  final _$peopleAtom = Atom(name: '_PeopleListStoreBase.people');

  @override
  ObservableList<PeopleEntity> get people {
    _$peopleAtom.reportRead();
    return super.people;
  }

  @override
  set people(ObservableList<PeopleEntity> value) {
    _$peopleAtom.reportWrite(value, super.people, () {
      super.people = value;
    });
  }

  final _$_PeopleListStoreBaseActionController =
      ActionController(name: '_PeopleListStoreBase');

  @override
  void setListPeople(List<PeopleEntity> value) {
    final _$actionInfo = _$_PeopleListStoreBaseActionController.startAction(
        name: '_PeopleListStoreBase.setListPeople');
    try {
      return super.setListPeople(value);
    } finally {
      _$_PeopleListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(PeopleEntity obj) {
    final _$actionInfo = _$_PeopleListStoreBaseActionController.startAction(
        name: '_PeopleListStoreBase.add');
    try {
      return super.add(obj);
    } finally {
      _$_PeopleListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
people: ${people}
    ''';
  }
}
