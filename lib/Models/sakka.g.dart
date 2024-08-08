// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sakka.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSakkaCollection on Isar {
  IsarCollection<Sakka> get sakkas => this.collection();
}

const SakkaSchema = CollectionSchema(
  name: r'Sakka',
  id: 5548785124673035863,
  properties: {
    r'isWinLhm': PropertySchema(
      id: 0,
      name: r'isWinLhm',
      type: IsarType.bool,
    ),
    r'isWinLna': PropertySchema(
      id: 1,
      name: r'isWinLna',
      type: IsarType.bool,
    ),
    r'lhm_score': PropertySchema(
      id: 2,
      name: r'lhm_score',
      type: IsarType.long,
    ),
    r'lna_score': PropertySchema(
      id: 3,
      name: r'lna_score',
      type: IsarType.long,
    )
  },
  estimateSize: _sakkaEstimateSize,
  serialize: _sakkaSerialize,
  deserialize: _sakkaDeserialize,
  deserializeProp: _sakkaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _sakkaGetId,
  getLinks: _sakkaGetLinks,
  attach: _sakkaAttach,
  version: '3.1.0+1',
);

int _sakkaEstimateSize(
  Sakka object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _sakkaSerialize(
  Sakka object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isWinLhm);
  writer.writeBool(offsets[1], object.isWinLna);
  writer.writeLong(offsets[2], object.lhm_score);
  writer.writeLong(offsets[3], object.lna_score);
}

Sakka _sakkaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sakka();
  object.id = id;
  object.isWinLhm = reader.readBool(offsets[0]);
  object.isWinLna = reader.readBool(offsets[1]);
  object.lhm_score = reader.readLong(offsets[2]);
  object.lna_score = reader.readLong(offsets[3]);
  return object;
}

P _sakkaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sakkaGetId(Sakka object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sakkaGetLinks(Sakka object) {
  return [];
}

void _sakkaAttach(IsarCollection<dynamic> col, Id id, Sakka object) {
  object.id = id;
}

extension SakkaQueryWhereSort on QueryBuilder<Sakka, Sakka, QWhere> {
  QueryBuilder<Sakka, Sakka, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SakkaQueryWhere on QueryBuilder<Sakka, Sakka, QWhereClause> {
  QueryBuilder<Sakka, Sakka, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SakkaQueryFilter on QueryBuilder<Sakka, Sakka, QFilterCondition> {
  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> isWinLhmEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWinLhm',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> isWinLnaEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWinLna',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lhm_scoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lhm_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lhm_scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lhm_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lhm_scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lhm_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lhm_scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lhm_score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lna_scoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lna_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lna_scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lna_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lna_scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lna_score',
        value: value,
      ));
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterFilterCondition> lna_scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lna_score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SakkaQueryObject on QueryBuilder<Sakka, Sakka, QFilterCondition> {}

extension SakkaQueryLinks on QueryBuilder<Sakka, Sakka, QFilterCondition> {}

extension SakkaQuerySortBy on QueryBuilder<Sakka, Sakka, QSortBy> {
  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByIsWinLhm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLhm', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByIsWinLhmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLhm', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByIsWinLna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLna', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByIsWinLnaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLna', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByLhm_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lhm_score', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByLhm_scoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lhm_score', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByLna_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lna_score', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> sortByLna_scoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lna_score', Sort.desc);
    });
  }
}

extension SakkaQuerySortThenBy on QueryBuilder<Sakka, Sakka, QSortThenBy> {
  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByIsWinLhm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLhm', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByIsWinLhmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLhm', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByIsWinLna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLna', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByIsWinLnaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinLna', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByLhm_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lhm_score', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByLhm_scoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lhm_score', Sort.desc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByLna_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lna_score', Sort.asc);
    });
  }

  QueryBuilder<Sakka, Sakka, QAfterSortBy> thenByLna_scoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lna_score', Sort.desc);
    });
  }
}

extension SakkaQueryWhereDistinct on QueryBuilder<Sakka, Sakka, QDistinct> {
  QueryBuilder<Sakka, Sakka, QDistinct> distinctByIsWinLhm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWinLhm');
    });
  }

  QueryBuilder<Sakka, Sakka, QDistinct> distinctByIsWinLna() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWinLna');
    });
  }

  QueryBuilder<Sakka, Sakka, QDistinct> distinctByLhm_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lhm_score');
    });
  }

  QueryBuilder<Sakka, Sakka, QDistinct> distinctByLna_score() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lna_score');
    });
  }
}

extension SakkaQueryProperty on QueryBuilder<Sakka, Sakka, QQueryProperty> {
  QueryBuilder<Sakka, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Sakka, bool, QQueryOperations> isWinLhmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWinLhm');
    });
  }

  QueryBuilder<Sakka, bool, QQueryOperations> isWinLnaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWinLna');
    });
  }

  QueryBuilder<Sakka, int, QQueryOperations> lhm_scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lhm_score');
    });
  }

  QueryBuilder<Sakka, int, QQueryOperations> lna_scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lna_score');
    });
  }
}
