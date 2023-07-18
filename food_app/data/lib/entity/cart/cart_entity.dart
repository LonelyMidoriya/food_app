import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

@freezed
class CartEntity with _$CartEntity {
  factory CartEntity({
    required Map<String, dynamic> dishes,
  }) = _CartEntity;

  factory CartEntity.fromJson(Map<String, Object?> json) =>
      _$CartEntityFromJson(json);
}
