import 'package:flutter_dojo/common/errors/failure.dart';

class GetAllTemplateError extends Failure {
  final String message;

  GetAllTemplateError({this.message});
}

class GetOneTemplateError extends Failure {}
