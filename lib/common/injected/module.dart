import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_dojo/app/data/template/datasources/people_datasource.dart';
import 'package:flutter_dojo/app/data/template/datasources/people_datasource_api.dart';
import 'package:flutter_dojo/app/data/template/repositories/people_repository_impl.dart';
import 'package:flutter_dojo/app/domain/template/repositories/people_repository.dart';
import 'package:flutter_dojo/app/domain/template/usecases/get_all_people_usecase_impl.dart';
import 'package:flutter_dojo/app/domain/template/usecases/interfaces/get_all_people_usecase.dart';
import 'package:flutter_dojo/app/ui/people/pages/people_list/people_list_controller.dart';
import 'package:flutter_dojo/app/ui/people/pages/people_list/people_list_store.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  getIt.registerLazySingleton<DioForNative>(() => Dio(BaseOptions(
        baseUrl: 'https://swapi.dev/api/',
      )));

  getIt.registerLazySingleton<GetAllPeopleUseCase>(
      () => GetAllPeopleUseCaseImpl(getIt()));

  getIt.registerLazySingleton<PeopleRepository>(
      () => PeopleRepositoryImpl(getIt()));

  getIt.registerLazySingleton<PeopleDataSource>(
      () => PeopleDataSourceApi(getIt()));

  getIt.registerLazySingleton(() => PeopleListStore());
  getIt.registerLazySingleton(() => PeopleListController(
      getIt<PeopleListStore>(), getIt<GetAllPeopleUseCase>()));
}
