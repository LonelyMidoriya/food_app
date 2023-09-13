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

OrderHistoryEntity _$OrderHistoryEntityFromJson(Map<String, dynamic> json) {
  return _OrderHistoryEntity.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryEntity {
  List<CartEntity> get carts => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryEntityCopyWith<OrderHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryEntityCopyWith<$Res> {
  factory $OrderHistoryEntityCopyWith(
          OrderHistoryEntity value, $Res Function(OrderHistoryEntity) then) =
      _$OrderHistoryEntityCopyWithImpl<$Res, OrderHistoryEntity>;
  @useResult
  $Res call({List<CartEntity> carts, String email});
}

/// @nodoc
class _$OrderHistoryEntityCopyWithImpl<$Res, $Val extends OrderHistoryEntity>
    implements $OrderHistoryEntityCopyWith<$Res> {
  _$OrderHistoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      carts: null == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryEntityCopyWith<$Res>
    implements $OrderHistoryEntityCopyWith<$Res> {
  factory _$$_OrderHistoryEntityCopyWith(_$_OrderHistoryEntity value,
          $Res Function(_$_OrderHistoryEntity) then) =
      __$$_OrderHistoryEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartEntity> carts, String email});
}

/// @nodoc
class __$$_OrderHistoryEntityCopyWithImpl<$Res>
    extends _$OrderHistoryEntityCopyWithImpl<$Res, _$_OrderHistoryEntity>
    implements _$$_OrderHistoryEntityCopyWith<$Res> {
  __$$_OrderHistoryEntityCopyWithImpl(
      _$_OrderHistoryEntity _value, $Res Function(_$_OrderHistoryEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
    Object? email = null,
  }) {
    return _then(_$_OrderHistoryEntity(
      carts: null == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryEntity implements _OrderHistoryEntity {
  _$_OrderHistoryEntity(
      {required final List<CartEntity> carts, required this.email})
      : _carts = carts;

  factory _$_OrderHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryEntityFromJson(json);

  final List<CartEntity> _carts;
  @override
  List<CartEntity> get carts {
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  final String email;

  @override
  String toString() {
    return 'OrderHistoryEntity(carts: $carts, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryEntity &&
            const DeepCollectionEquality().equals(other._carts, _carts) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_carts), email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryEntityCopyWith<_$_OrderHistoryEntity> get copyWith =>
      __$$_OrderHistoryEntityCopyWithImpl<_$_OrderHistoryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryEntityToJson(
      this,
    );
  }
}

abstract class _OrderHistoryEntity implements OrderHistoryEntity {
  factory _OrderHistoryEntity(
      {required final List<CartEntity> carts,
      required final String email}) = _$_OrderHistoryEntity;

  factory _OrderHistoryEntity.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryEntity.fromJson;

  @override
  List<CartEntity> get carts;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryEntityCopyWith<_$_OrderHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
