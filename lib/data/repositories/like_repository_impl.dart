import 'package:cat_tinder/data/models/cat_model.dart';
import 'package:cat_tinder/data/models/like_model.dart';
import 'package:cat_tinder/domain/repositories/like_repository.dart';

class InMemoryLikeRepository implements LikeRepository {
  final List<LikeModel> _likes = [];
  int _id = 0;

  @override
  int addLike(CatModel cat, DateTime datetime) {
    _likes.add(LikeModel(id: ++_id, cat: cat, dateTime: datetime));
    return _id;
  }

  @override
  List<LikeModel> getLikes() => List<LikeModel>.from(_likes);

  @override
  void removeLike(int id) {
    _likes.removeWhere((record) => record.id == id);
  }

  @override
  int getLikesAmount() => _likes.length;
}
