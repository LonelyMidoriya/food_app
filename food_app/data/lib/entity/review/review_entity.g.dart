// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewEntity _$$_ReviewEntityFromJson(Map<String, dynamic> json) =>
    _$_ReviewEntity(
      email: json['email'] as String,
      text: json['text'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ReviewEntityToJson(_$_ReviewEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'text': instance.text,
      'rating': instance.rating,
    };
