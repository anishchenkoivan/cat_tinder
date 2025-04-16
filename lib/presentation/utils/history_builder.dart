import 'package:cat_tinder/presentation/widgets/history_card.dart';

import '../../data/models/like_model.dart';
import '../../domain/usecases/get_history.dart';

class HistoryBuilder {
  final GetHistory historyProvider;

  HistoryBuilder(this.historyProvider);

  List<HistoryCard> getHistoryCards() => historyProvider.getHistoryData().map((LikeModel like) => HistoryCard(like)).toList();

  Map<String, bool> getDefaultFilter() {
    var cards = getHistoryCards();
    return { for (var c in cards.toSet()) c.data.cat.breedName : true };
  }
}