// ignore_for_file: constant_identifier_names, non_constant_identifier_names, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_entity.freezed.dart';
part 'food_entity.g.dart';

@freezed
class FoodEntity with _$FoodEntity {
  const factory FoodEntity({
    String? food_code,
    String? name,
    String? price,
    String? picture,
    String? picture_ori,
    DateTime? created_at,
    int? id,
  }) = _FoodEntity;

  factory FoodEntity.fromJson(Map<String, dynamic> json) =>
      _$FoodEntityFromJson(json);
}
