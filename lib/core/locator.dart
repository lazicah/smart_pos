import 'package:get_it/get_it.dart';
import 'package:smart_pos/core/datasource/datasource.dart';
import 'package:smart_pos/core/datasource/datasource_impl.dart';
import 'package:smart_pos/core/repository/repository.dart';
import 'package:smart_pos/core/services/api/apiservice.dart';
import 'package:smart_pos/core/services/api/apiservice_impl.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({bool test = false}) async {
  // Services

  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  locator.registerLazySingleton<RecipeRepository>(() => Repository());

  locator.registerLazySingleton<RecipeDatasource>(() => RecipeDataSourceImpl());

  // Utils

  //DataSources
}
