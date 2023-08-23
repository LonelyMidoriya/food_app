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
  DishEntity get dish => throw _privateConstructorUsedError;
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
  $Res call({DishEntity dish, int count});

  $DishEntityCopyWith<$Res> get dish;
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
    Object? dish = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as DishEntity,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DishEntityCopyWith<$Res> get dish {
    return $DishEntityCopyWith<$Res>(_value.dish, (value) {
      return _then(_value.copyWith(dish: value) as $Val);
    });
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
  $Res call({DishEntity dish, int count});

  @override
  $DishEntityCopyWith<$Res> get dish;
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
    Object? dish = null,
    Object? count = null,
  }) {
    return _then(_$_CartItemEntity(
      dish: null == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as DishEntity,
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
  _$_CartItemEntity({required this.dish, required this.count});

  factory _$_CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemEntityFromJson(json);

  @override
  final DishEntity dish;
  @override
  final int count;

  @override
  String toString() {
    return 'CartItemEntity(dish: $dish, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemEntity &&
            (identical(other.dish, dish) || other.dish == dish) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dish, count);

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
      {required final DishEntity dish,
      required final int count}) = _$_CartItemEntity;

  factory _CartItemEntity.fromJson(Map<String, dynamic> json) =
      _$_CartItemEntity.fromJson;

  @override
  DishEntity get dish;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemEntityCopyWith<_$_CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
