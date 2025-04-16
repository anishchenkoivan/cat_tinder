import 'package:cat_tinder/data/models/like_model.dart';

import '../repositories/like_repository.dart';

class GetHistory {
  final LikeRepository repository;

  GetHistory({required this.repository});

  List<LikeModel> getHistoryData() => repository.getLikes().toList();
}
