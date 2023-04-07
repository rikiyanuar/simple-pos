import 'package:flutter/material.dart';

import '../../domain/entity/food_entity.dart';
import '../../domain/use_case/app_usecases.dart';
import '../../external/provider/app_provider.dart';
import 'general_state.dart';

class FoodViewModel extends AppChangeNotifier {
  final AppUseCase useCase;
  final FoodEntity? foodEntity;
  List<FoodEntity> listFood = [];
  final foodCode = TextEditingController();
  final name = TextEditingController();
  final price = TextEditingController();
  final pictureUrl = TextEditingController();

  FoodViewModel({
    required this.useCase,
    required this.foodEntity,
  }) {
    if (foodEntity != null) {
      foodCode.value = TextEditingValue(text: foodEntity!.food_code ?? "");
      name.value = TextEditingValue(text: foodEntity!.name ?? "");
      price.value = TextEditingValue(text: foodEntity!.price ?? "0");
      pictureUrl.value = TextEditingValue(text: foodEntity!.picture ?? "");
    }
  }

  Future<GeneralState> getFood() async {
    try {
      final state = await useCase.getFood();

      return state.fold(
        (l) => const GeneralState.clientError(),
        (data) {
          listFood = data;
          notifyListeners();

          return const GeneralState.success();
        },
      );
    } catch (e) {
      return const GeneralState.clientError();
    }
  }

  Future<GeneralState> insertFood() async {
    try {
      final state = await useCase.insertFood(FoodEntity.fromJson({
        "food_code": foodCode.text,
        "name": name.text,
        "picture": pictureUrl.text,
        "price": price.text,
      }));

      return state.fold(
        (l) => const GeneralState.clientError(),
        (data) {
          return const GeneralState.success();
        },
      );
    } catch (e) {
      return const GeneralState.clientError();
    }
  }

  Future<GeneralState> updateFood() async {
    try {
      final state = await useCase.updateFood(FoodEntity.fromJson({
        "id": foodEntity!.id!,
        "food_code": foodCode.text,
        "name": name.text,
        "picture": pictureUrl.text,
        "price": price.text,
      }));

      return state.fold(
        (l) => const GeneralState.clientError(),
        (data) {
          return const GeneralState.success();
        },
      );
    } catch (e) {
      return const GeneralState.clientError();
    }
  }

  Future<GeneralState> deleteFood() async {
    try {
      final state = await useCase.deleteFood(
        FoodEntity.fromJson({"id": foodEntity!.id!}),
      );

      return state.fold(
        (l) => const GeneralState.clientError(),
        (data) {
          return const GeneralState.success();
        },
      );
    } catch (e) {
      return const GeneralState.clientError();
    }
  }
}
