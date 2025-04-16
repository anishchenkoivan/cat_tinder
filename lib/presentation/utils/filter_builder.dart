import '../../domain/usecases/get_history.dart';
import '../widgets/filter_item.dart';

class FilterBuilder {
  final GetHistory historyProvider;

  FilterBuilder(this.historyProvider);

  List<FilterItem> getFilterItems(Map<String, bool> filter) => filter.keys.map((String breed) => FilterItem(breedName: breed)).toList();
}