abstract class LikeEvent {}
class LikPressed extends LikeEvent {}

class LikeState {
  final int count;
}

class LikeBloc extends Bloc<LikeEvent>