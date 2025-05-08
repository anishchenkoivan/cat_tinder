import 'package:drift/drift.dart';

class Likes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get breedName => text()();
  TextColumn get country => text()();
  TextColumn get description => text()();
  TextColumn get lifespan => text()();
  TextColumn get imageUrl => text()();
  DateTimeColumn get dateTimeColumn => dateTime()();
}
