import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PeopleEntity extends Equatable {
  final String url;
  final String name;
  final String mass;
  final String height;

  PeopleEntity(
      {@required this.url,
      @required this.name,
      @required this.mass,
      @required this.height});

  @override
  List<Object> get props => [url, name, mass, height];
}
