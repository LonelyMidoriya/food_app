// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryEntity _$OrdersEntityFromJson(Map<String, dynamic> json) {
  return _OrdersEntity.fromJson(json);
}

/// @nodoc
mixin _$OrdersEntity {
  List<CartEntity> get carts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersEntityCopyWith<OrderHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEntityCopyWith<$Res> {
  factory $OrdersEntityCopyWith(
          OrderHistoryEntity value, $Res Function(OrderHistoryEntity) then) =
      _$OrdersEntityCopyWithImpl<$Res, OrderHistoryEntity>;
  @useResult
  $Res call({List<CartEntity> carts});
}

/// @nodoc
class _$OrdersEntityCopyWithImpl<$Res, $Val extends OrderHistoryEntity>
    implements $OrdersEntityCopyWith<$Res> {
  _$OrdersEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
  }) {
    return _then(_value.copyWith(
      carts: null == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersEntityCopyWith<$Res>
    implements $OrdersEntityCopyWith<$Res> {
  factory _$$_OrdersEntityCopyWith(
          _$_OrdersEntity value, $Res Function(_$_OrdersEntity) then) =
      __$$_OrdersEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartEntity> carts});
}

/// @nodoc
class __$$_OrdersEntityCopyWithImpl<$Res>
    extends _$OrdersEntityCopyWithImpl<$Res, _$_OrdersEntity>
    implements _$$_OrdersEntityCopyWith<$Res> {
  __$$_OrdersEntityCopyWithImpl(
      _$_OrdersEntity _value, $Res Function(_$_OrdersEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
  }) {
    return _then(_$_OrdersEntity(
      carts: null == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersEntity implements _OrdersEntity {
  _$_OrdersEntity({required final List<CartEntity> carts}) : _carts = carts;

  factory _$_OrdersEntity.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersEntityFromJson(json);

  final List<CartEntity> _carts;
  @override
  List<CartEntity> get carts {
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  String toString() {
    return 'OrdersEntity(carts: $carts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersEntity &&
            const DeepCollectionEquality().equals(other._carts, _carts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_carts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersEntityCopyWith<_$_OrdersEntity> get copyWith =>
      __$$_OrdersEntityCopyWithImpl<_$_OrdersEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersEntityToJson(
      this,
    );
  }
}

abstract class _OrdersEntity implements OrderHistoryEntity {
  factory _OrdersEntity({required final List<CartEntity> carts}) =
      _$_OrdersEntity;

  factory _OrdersEntity.fromJson(Map<String, dynamic> json) =
      _$_OrdersEntity.fromJson;

  @override
  List<CartEntity> get carts;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersEntityCopyWith<_$_OrdersEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
