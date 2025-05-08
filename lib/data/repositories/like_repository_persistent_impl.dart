import 'dart:async';

import 'package:drift/drift.dart';

import '../../domain/repositories/like_repository.dart';
import '../datasources/database/database.dart';
import '../models/cat_model.dart';
import '../models/like_model.dart';

class PersistentLikeRepository implements LikeRepository {
  final AppDatabase _db;
  final List<LikeModel> _cache = [];
  int _nextId = 1;
  bool _loaded = false;

  PersistentLikeRepository(this._db);

  Future<void> init() async {
    print("INITING");
    final rows = await _db.select(_db.likes).get();
    _cache.clear();
    for (final row in rows) {
      _cache.add(
        LikeModel(
          id: row.id,
          cat: CatModel(
            breedName: row.breedName,
            country: row.country,
            description: row.description,
            lifespan: row.lifespan,
            imageUrl: row.imageUrl,
          ),
          dateTime: row.dateTimeColumn,
        ),
      );
      _nextId = row.id >= _nextId ? row.id + 1 : _nextId;
    }
    _loaded = true;
    print(_loaded);
  }

  void _ensureLoaded() {
    if (!_loaded) {
      throw Exception('Repository not initialized');
    }
  }

  @override
  int addLike(CatModel cat, DateTime datetime) {
    _ensureLoaded();
    final id = _nextId++;
    final like = LikeModel(id: id, cat: cat, dateTime: datetime);
    _cache.add(like);

    _db.into(_db.likes).insert(
          LikesCompanion.insert(
            id: Value(id),
            breedName: cat.breedName,
            country: cat.country,
            description: cat.description,
            lifespan: cat.lifespan,
            imageUrl: cat.imageUrl,
            dateTimeColumn: datetime,
          ),
        );

    return id;
  }

  @override
  List<LikeModel> getLikes() {
    _ensureLoaded();
    return List.unmodifiable(_cache);
  }

  @override
  void removeLike(int id) {
    _ensureLoaded();
    _cache.removeWhere((like) => like.id == id);
    (_db.delete(_db.likes)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  int getLikesAmount() {
    _ensureLoaded();
    return _cache.length;
  }
}
