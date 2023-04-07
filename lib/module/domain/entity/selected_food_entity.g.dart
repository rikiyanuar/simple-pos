// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_food_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelectedFoodEntity _$$_SelectedFoodEntityFromJson(
        Map<String, dynamic> json) =>
    _$_SelectedFoodEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      picture: json['picture'] as String?,
      picture_ori: json['picture_ori'] as String?,
      price: json['price'] as int,
      qty: json['qty'] as int,
      subtotal: json['subtotal'] as int,
    );

Map<String, dynamic> _$$_SelectedFoodEntityToJson(
        _$_SelectedFoodEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'picture_ori': instance.picture_ori,
      'price': instance.price,
      'qty': instance.qty,
      'subtotal': instance.subtotal,
    };
