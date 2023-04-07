// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodEntity _$$_FoodEntityFromJson(Map<String, dynamic> json) =>
    _$_FoodEntity(
      food_code: json['food_code'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      picture: json['picture'] as String?,
      picture_ori: json['picture_ori'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_FoodEntityToJson(_$_FoodEntity instance) =>
    <String, dynamic>{
      'food_code': instance.food_code,
      'name': instance.name,
      'price': instance.price,
      'picture': instance.picture,
      'picture_ori': instance.picture_ori,
      'created_at': instance.created_at?.toIso8601String(),
      'id': instance.id,
    };
