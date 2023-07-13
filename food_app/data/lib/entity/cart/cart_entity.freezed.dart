// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartEntity _$CartEntityFromJson(Map<String, dynamic> json) {
  return _CartEntity.fromJson(json);
}

/// @nodoc
mixin _$CartEntity {
  Map<String, dynamic> get dishes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartEntityCopyWith<CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEntityCopyWith<$Res> {
  factory $CartEntityCopyWith(
          CartEntity value, $Res Function(CartEntity) then) =
      _$CartEntityCopyWithImpl<$Res, CartEntity>;
  @useResult
  $Res call({Map<String, dynamic> dishes});
}

/// @nodoc
class _$CartEntityCopyWithImpl<$Res, $Val extends CartEntity>
    implements $CartEntityCopyWith<$Res> {
  _$CartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishes = null,
  }) {
    return _then(_value.copyWith(
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartEntityCopyWith<$Res>
    implements $CartEntityCopyWith<$Res> {
  factory _$$_CartEntityCopyWith(
          _$_CartEntity value, $Res Function(_$_CartEntity) then) =
      __$$_CartEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> dishes});
}

/// @nodoc
class __$$_CartEntityCopyWithImpl<$Res>
    extends _$CartEntityCopyWithImpl<$Res, _$_CartEntity>
    implements _$$_CartEntityCopyWith<$Res> {
  __$$_CartEntityCopyWithImpl(
      _$_CartEntity _value, $Res Function(_$_CartEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dishes = null,
  }) {
    return _then(_$_CartEntity(
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartEntity implements _CartEntity {
  _$_CartEntity({required final Map<String, dynamic> dishes})
      : _dishes = dishes;

  factory _$_CartEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CartEntityFromJson(json);

  final Map<String, dynamic> _dishes;
  @override
  Map<String, dynamic> get dishes {
    if (_dishes is EqualUnmodifiableMapView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dishes);
  }

  @override
  String toString() {
    return 'CartEntity(dishes: $dishes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartEntity &&
            const DeepCollectionEquality().equals(other._dishes, _dishes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dishes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartEntityCopyWith<_$_CartEntity> get copyWith =>
      __$$_CartEntityCopyWithImpl<_$_CartEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartEntityToJson(
      this,
    );
  }
}

abstract class _CartEntity implements CartEntity {
  factory _CartEntity({required final Map<String, dynamic> dishes}) =
      _$_CartEntity;

  factory _CartEntity.fromJson(Map<String, dynamic> json) =
      _$_CartEntity.fromJson;

  @override
  Map<String, dynamic> get dishes;
  @override
  @JsonKey(ignore: true)
  _$$_CartEntityCopyWith<_$_CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
