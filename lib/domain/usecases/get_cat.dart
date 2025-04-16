import 'package:cat_tinder/data/models/cat_model.dart';
import 'package:cat_tinder/domain/repositories/cat_repository.dart';

class GetCat {
  CatRepository repository;
  GetCat({required this.repository});

  Future<CatModel> getCat() {
    return repository.getCat();
  }
}
