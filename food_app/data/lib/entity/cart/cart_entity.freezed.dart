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
  List<CartItemEntity> get cartItems => throw _privateConstructorUsedError;

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
  $Res call({List<CartItemEntity> cartItems});
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
    Object? cartItems = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemEntity>,
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
  $Res call({List<CartItemEntity> cartItems});
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
    Object? cartItems = null,
  }) {
    return _then(_$_CartEntity(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItemEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartEntity implements _CartEntity {
  _$_CartEntity({required final List<CartItemEntity> cartItems})
      : _cartItems = cartItems;

  factory _$_CartEntity.fromJson(Map<String, dynamic> json) =>
      _$$_CartEntityFromJson(json);

  final List<CartItemEntity> _cartItems;
  @override
  List<CartItemEntity> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  String toString() {
    return 'CartEntity(cartItems: $cartItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartEntity &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItems));

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
  factory _CartEntity({required final List<CartItemEntity> cartItems}) =
      _$_CartEntity;

  factory _CartEntity.fromJson(Map<String, dynamic> json) =
      _$_CartEntity.fromJson;

  @override
  List<CartItemEntity> get cartItems;
  @override
  @JsonKey(ignore: true)
  _$$_CartEntityCopyWith<_$_CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
