// TODO: Qual a necessidade de ter outra classe para representar o modelo?
// TODO: Por quê não podemos ter somente uma classe entity ou model?

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dojo/app/domain/template/entities/people_entity.dart';

class PeopleModel extends PeopleEntity {
  PeopleModel(
      {@required String height,
      @required String url,
      @required String mass,
      @required String name})
      : super(height: height, url: url, mass: mass, name: name);

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'name': name,
      'mass': mass,
      'height': height,
    };
  }

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel(
      url: map['url'],
      name: map['name'],
      mass: map['mass'],
      height: map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromJson(String source) =>
      PeopleModel.fromMap(json.decode(source));
}
