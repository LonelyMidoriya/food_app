// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItemEntity _$CartItemEntityFromJson(Map<String, dynamic> json) {
  return _CartItemEntity.fromJson(json);
}

/// @nodoc
mixin _$CartItemEntity {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemEntityCopyWith<CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEntityCopyWith<$Res> {
  factory $CartItemEntityCopyWith(
          CartItemEntity value, $Res Function(CartItemEntity) then) =
      _$CartItemEntityCopyWithImpl<$Res, CartItemEntity>;
  @useResult
  $Res call(
      {String name,
      String imageUrl,
      double cost,
      String type,
      String description,
      int count});
}

/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res, $Val extends CartItemEntity>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._value, this._then);

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
    Object? count = null,
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
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemEntityCopyWith<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  factory _$$_CartItemEntityCopyWith(
          _$_CartItemEntity value, $Res Function(_$_CartItemEntity) then) =
      __$$_CartItemEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String imageUrl,
      double cost,
      String type,
      String description,
      int count});
}

/// @nodoc
class __$$_CartItemEntityCopyWithImpl<$Res>
    extends _$CartItemEntityCopyWithImpl<$Res, _$_CartItemEntity>
    implements _$$_CartItemEntityCopyWith<$Res> {
  __$$_CartItemEntityCopyWithImpl(
      _$_CartItemEntity _value, $Res Function(_$_CartItemEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? cost = null,
    Object? type = null,
    Object? description = null,
    Object? count = null,
  }) {
    return _then(_$_CartItemEntity(
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
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartItemEntity implements _CartItemEntity {
  _$_CartItemEntity(
      {required this.name,
      required this.imageUrl,
      required this.cost,
      required this.type,
      required this.description,
      required this.count});

  factory _$_CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemEntityFromJson(json);

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
  final int count;

  @override
  String toString() {
    return 'CartItemEntity(name: $name, imageUrl: $imageUrl, cost: $cost, type: $type, description: $description, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageUrl, cost, type, description, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemEntityCopyWith<_$_CartItemEntity> get copyWith =>
      __$$_CartItemEntityCopyWithImpl<_$_CartItemEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemEntityToJson(
      this,
    );
  }
}

abstract class _CartItemEntity implements CartItemEntity {
  factory _CartItemEntity(
      {required final String name,
      required final String imageUrl,
      required final double cost,
      required final String type,
      required final String description,
      required final int count}) = _$_CartItemEntity;

  factory _CartItemEntity.fromJson(Map<String, dynamic> json) =
      _$_CartItemEntity.fromJson;

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
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemEntityCopyWith<_$_CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
