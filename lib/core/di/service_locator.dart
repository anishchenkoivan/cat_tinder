import 'package:cat_tinder/data/datasources/database/database.dart' as db;
import 'package:cat_tinder/domain/repositories/like_repository.dart';
import 'package:cat_tinder/domain/usecases/delete_like.dart';
import 'package:cat_tinder/domain/usecases/get_history.dart';
import 'package:cat_tinder/presentation/utils/history_builder.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/like_repository_impl.dart';
import '../../data/repositories/like_repository_persistent_impl.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../data/repositories/cat_repository_impl.dart';
import '../../domain/usecases/get_cat.dart';
import '../../domain/usecases/like.dart';
import '../../presentation/bloc/history_bloc.dart';
import '../../presentation/bloc/like_bloc.dart';
import '../../presentation/utils/filter_builder.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<CatRepository>(CatApiRepository());
  getIt.registerSingleton<GetCat>(GetCat(repository: getIt<CatRepository>()));

  getIt.registerSingleton<db.AppDatabase>(db.AppDatabase());
  PersistentLikeRepository likeRepository = PersistentLikeRepository(getIt<db.AppDatabase>());
  await likeRepository.init();
  getIt.registerSingleton<LikeRepository>(likeRepository);
  getIt.registerSingleton<Like>(Like(repository: getIt<LikeRepository>()));

  getIt.registerFactory(() => LikeBloc(getIt<Like>(), getIt<GetCat>()));

  getIt.registerSingleton<GetHistory>(
      GetHistory(repository: getIt<LikeRepository>()));
  getIt.registerFactory(() => HistoryBuilder(getIt<GetHistory>()));

  getIt.registerSingleton<DeleteLike>(
      DeleteLike(repository: getIt<LikeRepository>()));

  getIt.registerFactory(() => HistoryBloc(
      historyBuilder: getIt<HistoryBuilder>(),
      deleteLike: getIt<DeleteLike>()));

  getIt.registerFactory(() => FilterBuilder(getIt<GetHistory>()));
}
