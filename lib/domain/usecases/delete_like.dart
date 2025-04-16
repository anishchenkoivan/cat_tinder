import 'package:cat_tinder/domain/repositories/like_repository.dart';

class DeleteLike {
  final LikeRepository repository;

  DeleteLike({required this.repository});

  void deleteLike(int id) {
    repository.removeLike(id);
  }
}