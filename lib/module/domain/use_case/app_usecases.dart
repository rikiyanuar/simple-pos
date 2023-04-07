import '../../external/libraries/dartz.dart';
import '../entity/failure.dart';
import '../entity/food_entity.dart';
import '../repositories/app_repository.dart';
import 'get_food_use_case.dart';
import 'insert_food_use_case.dart';
import 'update_food_use_case.dart';
import 'use_case.dart';

abstract class AppUseCase {
  Future<Either<Failure, List<FoodEntity>>> getFood();
  Future<Either<Failure, FoodEntity>> insertFood(FoodEntity food);
  Future<Either<Failure, FoodEntity>> updateFood(FoodEntity food);
}

class AppUseCaseImpl extends AppUseCase {
  final AppRepository repository;

  AppUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<FoodEntity>>> getFood() {
    final response = GetFoodUseCase(repository: repository);

    return response(NoParams());
  }

  @override
  Future<Either<Failure, FoodEntity>> insertFood(FoodEntity food) {
    final response = InsertFoodUseCase(repository: repository);

    return response(food);
  }

  @override
  Future<Either<Failure, FoodEntity>> updateFood(FoodEntity food) {
    final response = UpdateFoodUseCase(repository: repository);

    return response(food);
  }
}
