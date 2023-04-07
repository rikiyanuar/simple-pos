// ignore_for_file: constant_identifier_names, non_constant_identifier_names, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_food_entity.freezed.dart';
part 'selected_food_entity.g.dart';

@freezed
class SelectedFoodEntity with _$SelectedFoodEntity {
  const factory SelectedFoodEntity({
    int? id,
    String? name,
    String? picture,
    String? picture_ori,
    required int price,
    required int qty,
    required int subtotal,
  }) = _SelectedFoodEntity;

  factory SelectedFoodEntity.fromJson(Map<String, dynamic> json) =>
      _$SelectedFoodEntityFromJson(json);
}
