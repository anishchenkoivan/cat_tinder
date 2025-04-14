import 'package:cat_tinder/data/models/like_model.dart';

import '../../data/models/cat_model.dart';

abstract class LikeRepository {
  int addLike(CatModel catMode, DateTime datetime);
  List<LikeModel> getLikes();
  void removeLike(int id);
  int getLikesAmount();
}