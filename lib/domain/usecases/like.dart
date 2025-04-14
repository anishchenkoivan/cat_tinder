import 'package:cat_tinder/data/models/cat_model.dart';
import 'package:cat_tinder/domain/repositories/like_repository.dart';

class Like {
  LikeRepository repository;

  Like({required this.repository});

  void like(CatModel cat) {
    repository.addLike(cat, DateTime.now());
  }
}