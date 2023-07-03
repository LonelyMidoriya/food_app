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
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

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
      {String name,
      String imageUrl,
      double cost,
      String type,
      String description});
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
      {String name,
      String imageUrl,
      double cost,
      String type,
      String description});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DishEntity implements _DishEntity {
  _$_DishEntity(
      {required this.name,
      required this.imageUrl,
      required this.cost,
      required this.type,
      required this.description});

  factory _$_DishEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DishEntityFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final double cost;
  @override
  final String type;
  @override
  final String description;

  @override
  String toString() {
    return 'DishEntity(name: $name, imageUrl: $imageUrl, cost: $cost, type: $type, description: $description)';
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
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageUrl, cost, type, description);

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

abstract class _DishEntity implements DishEntity {
  factory _DishEntity(
      {required final String name,
      required final String imageUrl,
      required final double cost,
      required final String type,
      required final String description}) = _$_DishEntity;

  factory _DishEntity.fromJson(Map<String, dynamic> json) =
      _$_DishEntity.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  double get cost;
  @override
  String get type;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_DishEntityCopyWith<_$_DishEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
