import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cat_model.dart';
import '../../domain/usecases/get_cat.dart';
import '../../domain/usecases/like.dart';

abstract class MainEvent {}

class LikePressed extends MainEvent {
  final CatModel cat;

  LikePressed(this.cat);
}

class DislikePressed extends MainEvent {}

class MainState {
  final int counter;
  final Future<CatModel> cat;

  MainState(this.counter, this.cat);
}

class DislikeState {}

class LikeBloc extends Bloc<MainEvent, MainState> {
  final Like like;
  final GetCat getCat;

  LikeBloc(this.like, this.getCat) : super(MainState(like.repository.getLikesAmount(), getCat.getCat())) {
    on<LikePressed>((event, emit) {
      like.like(event.cat);
      _emitNewCat(emit);
    });

    on<DislikePressed>((event, emit) {
      _emitNewCat(emit);
    });
  }

  void _emitNewCat(Emitter<MainState> emit) {
    emit(MainState(like.repository.getLikesAmount(), getCat.getCat()));
  }
}
