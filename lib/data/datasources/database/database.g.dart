// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LikesTable extends Likes with TableInfo<$LikesTable, Like> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _breedNameMeta =
      const VerificationMeta('breedName');
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
      'breed_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lifespanMeta =
      const VerificationMeta('lifespan');
  @override
  late final GeneratedColumn<String> lifespan = GeneratedColumn<String>(
      'lifespan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateTimeColumnMeta =
      const VerificationMeta('dateTimeColumn');
  @override
  late final GeneratedColumn<DateTime> dateTimeColumn =
      GeneratedColumn<DateTime>('date_time_column', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, breedName, country, description, lifespan, imageUrl, dateTimeColumn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'likes';
  @override
  VerificationContext validateIntegrity(Insertable<Like> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('breed_name')) {
      context.handle(_breedNameMeta,
          breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta));
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('lifespan')) {
      context.handle(_lifespanMeta,
          lifespan.isAcceptableOrUnknown(data['lifespan']!, _lifespanMeta));
    } else if (isInserting) {
      context.missing(_lifespanMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('date_time_column')) {
      context.handle(
          _dateTimeColumnMeta,
          dateTimeColumn.isAcceptableOrUnknown(
              data['date_time_column']!, _dateTimeColumnMeta));
    } else if (isInserting) {
      context.missing(_dateTimeColumnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Like map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Like(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      breedName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed_name'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      lifespan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lifespan'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      dateTimeColumn: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_column'])!,
    );
  }

  @override
  $LikesTable createAlias(String alias) {
    return $LikesTable(attachedDatabase, alias);
  }
}

class Like extends DataClass implements Insertable<Like> {
  final int id;
  final String breedName;
  final String country;
  final String description;
  final String lifespan;
  final String imageUrl;
  final DateTime dateTimeColumn;
  const Like(
      {required this.id,
      required this.breedName,
      required this.country,
      required this.description,
      required this.lifespan,
      required this.imageUrl,
      required this.dateTimeColumn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['breed_name'] = Variable<String>(breedName);
    map['country'] = Variable<String>(country);
    map['description'] = Variable<String>(description);
    map['lifespan'] = Variable<String>(lifespan);
    map['image_url'] = Variable<String>(imageUrl);
    map['date_time_column'] = Variable<DateTime>(dateTimeColumn);
    return map;
  }

  LikesCompanion toCompanion(bool nullToAbsent) {
    return LikesCompanion(
      id: Value(id),
      breedName: Value(breedName),
      country: Value(country),
      description: Value(description),
      lifespan: Value(lifespan),
      imageUrl: Value(imageUrl),
      dateTimeColumn: Value(dateTimeColumn),
    );
  }

  factory Like.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Like(
      id: serializer.fromJson<int>(json['id']),
      breedName: serializer.fromJson<String>(json['breedName']),
      country: serializer.fromJson<String>(json['country']),
      description: serializer.fromJson<String>(json['description']),
      lifespan: serializer.fromJson<String>(json['lifespan']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      dateTimeColumn: serializer.fromJson<DateTime>(json['dateTimeColumn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'breedName': serializer.toJson<String>(breedName),
      'country': serializer.toJson<String>(country),
      'description': serializer.toJson<String>(description),
      'lifespan': serializer.toJson<String>(lifespan),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'dateTimeColumn': serializer.toJson<DateTime>(dateTimeColumn),
    };
  }

  Like copyWith(
          {int? id,
          String? breedName,
          String? country,
          String? description,
          String? lifespan,
          String? imageUrl,
          DateTime? dateTimeColumn}) =>
      Like(
        id: id ?? this.id,
        breedName: breedName ?? this.breedName,
        country: country ?? this.country,
        description: description ?? this.description,
        lifespan: lifespan ?? this.lifespan,
        imageUrl: imageUrl ?? this.imageUrl,
        dateTimeColumn: dateTimeColumn ?? this.dateTimeColumn,
      );
  Like copyWithCompanion(LikesCompanion data) {
    return Like(
      id: data.id.present ? data.id.value : this.id,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      country: data.country.present ? data.country.value : this.country,
      description:
          data.description.present ? data.description.value : this.description,
      lifespan: data.lifespan.present ? data.lifespan.value : this.lifespan,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      dateTimeColumn: data.dateTimeColumn.present
          ? data.dateTimeColumn.value
          : this.dateTimeColumn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Like(')
          ..write('id: $id, ')
          ..write('breedName: $breedName, ')
          ..write('country: $country, ')
          ..write('description: $description, ')
          ..write('lifespan: $lifespan, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('dateTimeColumn: $dateTimeColumn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, breedName, country, description, lifespan, imageUrl, dateTimeColumn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Like &&
          other.id == this.id &&
          other.breedName == this.breedName &&
          other.country == this.country &&
          other.description == this.description &&
          other.lifespan == this.lifespan &&
          other.imageUrl == this.imageUrl &&
          other.dateTimeColumn == this.dateTimeColumn);
}

class LikesCompanion extends UpdateCompanion<Like> {
  final Value<int> id;
  final Value<String> breedName;
  final Value<String> country;
  final Value<String> description;
  final Value<String> lifespan;
  final Value<String> imageUrl;
  final Value<DateTime> dateTimeColumn;
  const LikesCompanion({
    this.id = const Value.absent(),
    this.breedName = const Value.absent(),
    this.country = const Value.absent(),
    this.description = const Value.absent(),
    this.lifespan = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.dateTimeColumn = const Value.absent(),
  });
  LikesCompanion.insert({
    this.id = const Value.absent(),
    required String breedName,
    required String country,
    required String description,
    required String lifespan,
    required String imageUrl,
    required DateTime dateTimeColumn,
  })  : breedName = Value(breedName),
        country = Value(country),
        description = Value(description),
        lifespan = Value(lifespan),
        imageUrl = Value(imageUrl),
        dateTimeColumn = Value(dateTimeColumn);
  static Insertable<Like> custom({
    Expression<int>? id,
    Expression<String>? breedName,
    Expression<String>? country,
    Expression<String>? description,
    Expression<String>? lifespan,
    Expression<String>? imageUrl,
    Expression<DateTime>? dateTimeColumn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (breedName != null) 'breed_name': breedName,
      if (country != null) 'country': country,
      if (description != null) 'description': description,
      if (lifespan != null) 'lifespan': lifespan,
      if (imageUrl != null) 'image_url': imageUrl,
      if (dateTimeColumn != null) 'date_time_column': dateTimeColumn,
    });
  }

  LikesCompanion copyWith(
      {Value<int>? id,
      Value<String>? breedName,
      Value<String>? country,
      Value<String>? description,
      Value<String>? lifespan,
      Value<String>? imageUrl,
      Value<DateTime>? dateTimeColumn}) {
    return LikesCompanion(
      id: id ?? this.id,
      breedName: breedName ?? this.breedName,
      country: country ?? this.country,
      description: description ?? this.description,
      lifespan: lifespan ?? this.lifespan,
      imageUrl: imageUrl ?? this.imageUrl,
      dateTimeColumn: dateTimeColumn ?? this.dateTimeColumn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lifespan.present) {
      map['lifespan'] = Variable<String>(lifespan.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (dateTimeColumn.present) {
      map['date_time_column'] = Variable<DateTime>(dateTimeColumn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikesCompanion(')
          ..write('id: $id, ')
          ..write('breedName: $breedName, ')
          ..write('country: $country, ')
          ..write('description: $description, ')
          ..write('lifespan: $lifespan, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('dateTimeColumn: $dateTimeColumn')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikesTable likes = $LikesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [likes];
}

typedef $$LikesTableCreateCompanionBuilder = LikesCompanion Function({
  Value<int> id,
  required String breedName,
  required String country,
  required String description,
  required String lifespan,
  required String imageUrl,
  required DateTime dateTimeColumn,
});
typedef $$LikesTableUpdateCompanionBuilder = LikesCompanion Function({
  Value<int> id,
  Value<String> breedName,
  Value<String> country,
  Value<String> description,
  Value<String> lifespan,
  Value<String> imageUrl,
  Value<DateTime> dateTimeColumn,
});

class $$LikesTableFilterComposer extends Composer<_$AppDatabase, $LikesTable> {
  $$LikesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lifespan => $composableBuilder(
      column: $table.lifespan, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeColumn => $composableBuilder(
      column: $table.dateTimeColumn,
      builder: (column) => ColumnFilters(column));
}

class $$LikesTableOrderingComposer
    extends Composer<_$AppDatabase, $LikesTable> {
  $$LikesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lifespan => $composableBuilder(
      column: $table.lifespan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeColumn => $composableBuilder(
      column: $table.dateTimeColumn,
      builder: (column) => ColumnOrderings(column));
}

class $$LikesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikesTable> {
  $$LikesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get lifespan =>
      $composableBuilder(column: $table.lifespan, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeColumn => $composableBuilder(
      column: $table.dateTimeColumn, builder: (column) => column);
}

class $$LikesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LikesTable,
    Like,
    $$LikesTableFilterComposer,
    $$LikesTableOrderingComposer,
    $$LikesTableAnnotationComposer,
    $$LikesTableCreateCompanionBuilder,
    $$LikesTableUpdateCompanionBuilder,
    (Like, BaseReferences<_$AppDatabase, $LikesTable, Like>),
    Like,
    PrefetchHooks Function()> {
  $$LikesTableTableManager(_$AppDatabase db, $LikesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LikesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> breedName = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> lifespan = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<DateTime> dateTimeColumn = const Value.absent(),
          }) =>
              LikesCompanion(
            id: id,
            breedName: breedName,
            country: country,
            description: description,
            lifespan: lifespan,
            imageUrl: imageUrl,
            dateTimeColumn: dateTimeColumn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String breedName,
            required String country,
            required String description,
            required String lifespan,
            required String imageUrl,
            required DateTime dateTimeColumn,
          }) =>
              LikesCompanion.insert(
            id: id,
            breedName: breedName,
            country: country,
            description: description,
            lifespan: lifespan,
            imageUrl: imageUrl,
            dateTimeColumn: dateTimeColumn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LikesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LikesTable,
    Like,
    $$LikesTableFilterComposer,
    $$LikesTableOrderingComposer,
    $$LikesTableAnnotationComposer,
    $$LikesTableCreateCompanionBuilder,
    $$LikesTableUpdateCompanionBuilder,
    (Like, BaseReferences<_$AppDatabase, $LikesTable, Like>),
    Like,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikesTableTableManager get likes =>
      $$LikesTableTableManager(_db, _db.likes);
}
