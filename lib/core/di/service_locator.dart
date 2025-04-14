import 'package:cat_tinder/domain/repositories/like_repository.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/like_repository_impl.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../data/repositories/cat_repository_impl.dart';
import '../../domain/usecases/get_cat.dart';
import '../../domain/usecases/like.dart';


final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CatRepository>(CatApiRepository());
  getIt.registerSingleton<GetCat>(GetCat(repository: getIt<CatRepository>()));

  getIt.registerSingleton<LikeRepository>(InMemoryLikeRepository());
  getIt.registerSingleton<Like>(Like(repository: getIt<LikeRepository>()));
}