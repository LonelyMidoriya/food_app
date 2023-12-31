// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DishEntity _$DishEntityFromJson(Map<String, dynamic> json) {
  return _DishEntity.fromJson(json);
}

/// @nodoc
mixin _$DishEntity {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  double get cost => throw _privateConstructorUsedError;
  @HiveField(3)
  String get type => throw _privateConstructorUsedError;
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;
  @HiveField(5)
  Map<dynamic, dynamic> get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishEntityCopyWith<DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishEntityCopyWith<$Res> {
  factory $DishEntityCopyWith(
          DishEntity value, $Res Function(DishEntity) then) =
      _$DishEntityCopyWithImpl<$Res, DishEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String imageUrl,
      @HiveField(2) double cost,
      @HiveField(3) String type,
      @HiveField(4) String description,
      @HiveField(5) Map<dynamic, dynamic> stats});
}

/// @nodoc
class _$DishEntityCopyWithImpl<$Res, $Val extends DishEntity>
    implements $DishEntityCopyWith<$Res> {
  _$DishEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? cost = null,
    Object? type = null,
    Object? description = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DishEntityCopyWith<$Res>
    implements $DishEntityCopyWith<$Res> {
  factory _$$_DishEntityCopyWith(
          _$_DishEntity value, $Res Function(_$_DishEntity) then) =
      __$$_DishEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String imageUrl,
      @HiveField(2) double cost,
      @HiveField(3) String type,
      @HiveField(4) String description,
      @HiveField(5) Map<dynamic, dynamic> stats});
}

/// @nodoc
class __$$_DishEntityCopyWithImpl<$Res>
    extends _$DishEntityCopyWithImpl<$Res, _$_DishEntity>
    implements _$$_DishEntityCopyWith<$Res> {
  __$$_DishEntityCopyWithImpl(
      _$_DishEntity _value, $Res Function(_$_DishEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? cost = null,
    Object? type = null,
    Object? description = null,
    Object? stats = null,
  }) {
    return _then(_$_DishEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DishEntity extends _DishEntity {
  _$_DishEntity(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.imageUrl,
      @HiveField(2) required this.cost,
      @HiveField(3) required this.type,
      @HiveField(4) required this.description,
      @HiveField(5) required final Map<dynamic, dynamic> stats})
      : _stats = stats,
        super._();

  factory _$_DishEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DishEntityFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String imageUrl;
  @override
  @HiveField(2)
  final double cost;
  @override
  @HiveField(3)
  final String type;
  @override
  @HiveField(4)
  final String description;
  final Map<dynamic, dynamic> _stats;
  @override
  @HiveField(5)
  Map<dynamic, dynamic> get stats {
    if (_stats is EqualUnmodifiableMapView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stats);
  }

  @override
  String toString() {
    return 'DishEntity(name: $name, imageUrl: $imageUrl, cost: $cost, type: $type, description: $description, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DishEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._stats, _stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, cost, type,
      description, const DeepCollectionEquality().hash(_stats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      __$$_DishEntityCopyWithImpl<_$_DishEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DishEntityToJson(
      this,
    );
  }
}

abstract class _DishEntity extends DishEntity {
  factory _DishEntity(
      {@HiveField(0) required final String name,
      @HiveField(1) required final String imageUrl,
      @HiveField(2) required final double cost,
      @HiveField(3) required final String type,
      @HiveField(4) required final String description,
      @HiveField(5) required final Map<dynamic, dynamic> stats}) = _$_DishEntity;
  _DishEntity._() : super._();

  factory _DishEntity.fromJson(Map<String, dynamic> json) =
      _$_DishEntity.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get imageUrl;
  @override
  @HiveField(2)
  double get cost;
  @override
  @HiveField(3)
  String get type;
  @override
  @HiveField(4)
  String get description;
  @override
  @HiveField(5)
  Map<dynamic, dynamic> get stats;
  @override
  @JsonKey(ignore: true)
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
