import 'package:cat_tinder/domain/usecases/delete_like.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/history_builder.dart';

abstract class HistoryEvent {}

class CardDeleted extends HistoryEvent {
  final int id;

  CardDeleted(this.id);
}

class CardFiltered extends HistoryEvent {
  final Map<String, bool> filter;

  CardFiltered(this.filter);
}

class HistoryState {
  final Map<String, bool> filter;

  HistoryState(this.filter);
}

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryBuilder historyBuilder;
  final DeleteLike deleteLike;
  HistoryBloc({required this.historyBuilder, required this.deleteLike})
      : super(HistoryState(historyBuilder.getDefaultFilter())) {
    on<CardFiltered>((event, emit) {
      emit(HistoryState(event.filter));
    });
    on<CardDeleted>((event, emit) {
      deleteLike.deleteLike(event.id);
      emit(HistoryState(historyBuilder.getDefaultFilter()));
    });
  }
}
