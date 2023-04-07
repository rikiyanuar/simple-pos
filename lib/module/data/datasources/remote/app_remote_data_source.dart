import '../../../domain/entity/food_entity.dart';
import '../../../external/service/service_helper.dart';

abstract class AppRemoteDataSource {
  Future<List<FoodEntity>> getFood();
  Future<FoodEntity> insertFood(FoodEntity food);
  Future<FoodEntity> updateFood(FoodEntity food);
}

class AppRemoteDataSourceImpl extends AppRemoteDataSource {
  final ServiceHelper serviceHelper;
  final String baseUrl;

  AppRemoteDataSourceImpl({
    required this.serviceHelper,
    required this.baseUrl,
  });

  @override
  Future<List<FoodEntity>> getFood() async {
    final response = await serviceHelper.get(baseUrl);
    final List list = response.data;

    return List<FoodEntity>.from(list.map((x) => FoodEntity.fromJson(x)));
  }

  @override
  Future<FoodEntity> insertFood(FoodEntity food) async {
    final response = await serviceHelper.post(
      baseUrl,
      data: food.toJson(),
    );

    return FoodEntity.fromJson(response.data);
  }

  @override
  Future<FoodEntity> updateFood(FoodEntity food) async {
    final response = await serviceHelper.put(
      "$baseUrl${food.id}",
      data: food.toJson(),
    );

    return FoodEntity.fromJson(response.data);
  }
}
