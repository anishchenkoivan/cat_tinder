import 'package:get_it/get_it.dart';

import '../../domain/repositories/cat_repository.dart';
import '../../data/repositories/cat_repository_impl.dart';
import '../../domain/usecases/get_cat.dart';


final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CatRepository>(CatApiRepository());
  getIt.registerSingleton<GetCat>(GetCat(repository: getIt<CatRepository>()));
}