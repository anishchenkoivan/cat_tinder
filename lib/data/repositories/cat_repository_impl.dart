import 'package:cat_tinder/data/models/cat_model.dart';

import '../../domain/repositories/cat_repository.dart';
import '../datasources/cat_api.dart';

class CatApiRepository implements CatRepository {

  @override
  Future<CatModel> getCat() {
    return CatApiFetcher().getCat();
  }

  CatApiRepository();
}